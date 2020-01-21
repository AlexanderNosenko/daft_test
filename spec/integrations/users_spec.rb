require 'swagger_helper'

RSpec.describe 'Users', type: :request, rswag: true do
  let_it_be(:user) { create(:user) }
  let_it_be(:user_id) { user.id }

  let(:params) do
    {
      user: attributes_for(:user)
    }
  end

  path '/users' do
    get 'List all available users in a given context' do
      tags 'Users'
      produces 'application/json'

      let_it_be(:external_users) do
        create_list(:user, 1)
      end

      response 200, :ok do
        schema(UserDescriptor.schema(
          collection: true,
          relationships: [],
          included: []
        ))

        run_test! do
          expect_json_sizes('data', ::User.count)
          expect_json('data.?.id', user.id.to_s)
        end
      end
    end

    post 'Create a user' do
      tags 'Users'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: UserDescriptor.new.request_attributes

      response 200, :ok do
        schema(UserDescriptor.schema(
          relationships: [],
          included: []
        ))

        run_test! do
          expected_value = params[:user][:id]
          expect_json('data.attributes.id', expected_value)
        end
      end

      response 422, :unprocessable_entity do
        before { params[:user][:name] = '' }

        schema(ModuleScaffold::Descriptors::ValidationErrorDescriptor.schema)

        run_test! do
          expect_json('errors.?.source.pointer', '/data/attributes/id')
          expect_json('errors.?.detail', 'blank')
        end
      end
    end
  end

  path '/users/{user_id}' do
    get 'Get details of a given user' do
      tags 'Users'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string

      response 200, :ok do
        schema(UserDescriptor.schema(
          relationships: [],
          included: []
        ))

        run_test! do
          expect_json('data.id', user.id.to_s)
        end
      end

      response 404, :record_not_found do
        let(:vertical_id) { 'non_existent' }

        schema(ModuleScaffold::Descriptors::RecordNotFoundErrorDescriptor.schema)
      end
    end

    patch 'Update a given user' do
      tags 'Users'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string
      parameter name: :params, in: :body, schema: UserDescriptor.new.request_attributes

      response 200, :ok do
        schema(UserDescriptor.schema(
          relationships: [],
          included: []
        ))

        run_test! do
          expected_value = params[:user][:id]
          expect_json('data.attributes.id', expected_value)
        end
      end

      response 422, :unprocessable_entity do
        before { params[:user][:name] = '' }

        schema(ModuleScaffold::Descriptors::ValidationErrorDescriptor.schema)

        run_test! do
          expect_json('errors.?.source.pointer', '/data/attributes/id')
          expect_json('errors.?.detail', 'blank')
        end
      end
    end

    delete 'Destroy user' do
      tags 'Users'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string

      response 200, :ok do
        schema({})

        it 'destroys the user' do |example|
          expect do
            submit_request(example.metadata)
          end.to change { ::User.count }.by(-1)
          assert_response_matches_metadata(example.metadata)
        end
      end
    end
  end
end
