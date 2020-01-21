require 'rails_helper'

RSpec.describe ::UserSerializer, type: :serializer do
  subject { described_class.new(resource).serializable_hash[:data] }
  let_it_be(:resource) { build_stubbed(:user) }

  describe 'serialized_json' do
    it 'returns correct id' do
      expect(subject[:id]).to eq resource.id.to_s
    end

    it 'returns correct type' do
      expect_correct_type(:user)
    end

    it 'returns correct attributes' do
      expect_correct_attributes([
        :name,
        :email,
        :date_of_birth
      ])
    end

    it 'returns none relationships' do
      expect_correct_relationships(nil)
    end
  end
end
