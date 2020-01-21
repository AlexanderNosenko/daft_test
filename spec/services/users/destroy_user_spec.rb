require 'rails_helper'

RSpec.describe ::Users::DestroyUser do
  subject { described_class.new(user).call }

  let_it_be(:user) { create(:user) }

  describe '#call' do
    it 'deletes user' do
      expect { subject }.to change { ::User.count }.by(-1)
    end
  end
end
