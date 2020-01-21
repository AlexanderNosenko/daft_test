require 'rails_helper'

RSpec.describe UserDecorator do
  subject(:described_object) { described_class.new(user) }

  describe '#has_birthday_today' do
    context 'does not birthday today' do
      let_it_be(:user) { build_stubbed(:user, date_of_birth: 1.day.ago) }

      it { expect(subject.has_birthday_today).to eq false }
    end

    context 'has not birthday today' do
      let_it_be(:user) { build_stubbed(:user, date_of_birth: 0.days.ago) }

      it { expect(subject.has_birthday_today).to eq true }
    end
  end
end
