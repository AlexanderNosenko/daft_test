module Users
  class CreateUser < BaseService

    def initialize(params)
      @params = params
    end

    def call
      create_user!
      send_registration_email!
      success(user)
    rescue ActiveRecord::RecordInvalid => e
      failure(ModelValidationError.new(e.record))
    end

    private

    attr_reader :params, :user

    def create_user!
      @user = ::User.create!(valid_params)
    end

    def send_registration_email!
      UserMailer.registration(user.id).deliver_later
    end

    def valid_params
      permitted_attributes(::User)
    end

  end
end
