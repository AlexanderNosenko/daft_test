class UsersController < BaseController

  def index
    authorize(::User)

    render_success(
      users
    )
  end

  def create
    authorize(::User)

    service = ::Users::CreateUser.call(params)

    render_service(service)
  end

  def show
    authorize(user)

    render_success(user)
  end

  def update
    authorize(user)

    service = ::Users::UpdateUser.call(user, params)

    render_service(service)
  end

  def destroy
    authorize(user)

    service = ::Users::DestroyUser.call(user)

    render_service(service)
  end

  private

  def user
    @user ||= users.find(params[:id])
  end

  def users
    @users ||= policy_scope(::User)
  end

end
