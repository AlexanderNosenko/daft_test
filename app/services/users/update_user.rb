module Users
  class UpdateUser < BaseService

    def initialize(user, params)
      @user = user
      @params = params
    end

    def call
      update_user!
      success(user)
    rescue ActiveRecord::RecordInvalid => e
      failure(ModelValidationError.new(e.record))
    end

    private

    attr_reader :params, :user

    def update_user!
      user.update!(valid_params)
    end

    def valid_params
      permitted_attributes(::User)
    end

  end
end
