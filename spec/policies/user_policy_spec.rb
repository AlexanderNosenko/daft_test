require 'rails_helper'

RSpec.describe ::UserPolicy, policy: true do
  subject { described_class.new(nil, user) }
  let(:resolved_scope) { described_class::Scope.new(nil, ::User.all).resolve }
  let_it_be(:user) { create(:user) }

  it { is_expected.to permit_actions([:index, :show, :create, :update, :destroy]) }

  context 'scope' do
    it 'has access to own user' do
      expect(resolved_scope).to include(user)
    end
  end

  specify do
    is_expected.to permit_mass_assignment_of(
      :name,
      :email,
      :date_of_birth
    )
  end
end
