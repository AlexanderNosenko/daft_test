require 'rails_helper'

RSpec.describe Users::UpdateUser do
  subject { described_class.new(user, ActionController::Parameters.new(params)).call }
  let_it_be(:user) { create(:user) }
  let(:params) do
    {
      user: {
        name: Faker::Name.first_name,
        email: Faker::Name.first_name,
        reset_password_token: Faker::Name.first_name,
        date_of_birth: Faker::Name.first_name
      }
    }
  end

  describe '#call' do
    context 'with valid params' do
      it 'doesnt create new user' do
        expect { subject }.to change { User.count }.by(0)
      end

      it 'updates user with correct attributes' do
        service = subject

        expect(service.success?).to eq true
        result = service.result
        expect(result).to be_a User

        params[:user].each do |key, value|
          expect(result[key]).to eq value
        end
      end
    end

    context 'with invalid params' do
      let(:params) do
        {
          user: {
            id: '',
            name: '',
            email: '',
            reset_password_token: '',
            date_of_birth: '',
            created_at: '',
            updated_at: ''
          }
        }
      end

      it 'returns invalid record as error attribute' do
        service = subject

        expect(service.success?).to eq false
        expect(service.result).to eq nil
        expect(service.error).to be_a ModuleScaffold::Errors::ValidationError
      end
    end
  end
end
