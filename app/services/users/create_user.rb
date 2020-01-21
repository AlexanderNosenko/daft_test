module Users
  class CreateUser < BaseService

    def initialize(params)
      @params = params
    end

    def call
      create_user!
      success(user)
    rescue ActiveRecord::RecordInvalid => e
      failure(ModelValidationError.new(e.record))
    end

    private

    attr_reader :params, :user

    def create_user!
      @user = ::User.create!(valid_params)
    end

    def valid_params
      permitted_attributes(::User)
    end

  end
end
