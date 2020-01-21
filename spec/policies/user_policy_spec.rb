require 'rails_helper'

RSpec.describe ::UserPolicy, policy: true do
  subject { described_class.new(nil, user) }
  let(:resolved_scope) { described_class::Scope.new(nil, ::User.all).resolve }
  let_it_be(:user) { create(:user) }
  let_it_be(:external_user) { create(:user) }

  it { is_expected.to permit_actions([:index, :show, :create, :update, :destroy]) }

  context 'scope' do
    it 'has access to own user' do
      expect(resolved_scope).to include(user)
    end

    it 'doesnt have access other users' do
      expect(resolved_scope).not_to include(external_user)
    end
  end

  specify do
    is_expected.to permit_mass_assignment_of(
      :id,
:name,
:email,
:reset_password_token,
:date_of_birth,
:created_at,
:updated_at
    )
  end

  context 'being not authorized' do
    it { is_expected.to forbid_actions([:index, :show, :create, :update, :destroy]) }
  end
end
