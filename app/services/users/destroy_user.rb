module Users
  class DestroyUser < BaseService

    def initialize(user)
      @user = user
    end

    def call
      user.destroy!
      success(user)
    rescue ActiveRecord::RecordNotDestroyed => e
      failure(e.record)
    end

    private

    attr_reader :params, :user

  end
end
