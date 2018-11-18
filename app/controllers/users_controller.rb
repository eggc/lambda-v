class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :password))

    if @user.save
      redirect_to(root_path)
    else
      render(action: :new)
    end
  end
end
