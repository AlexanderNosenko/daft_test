class UserDecorator < Draper::Decorator

  delegate_all

  def has_birthday_today
    date_of_birth.to_date == Time.zone.today.to_date
  end

end
