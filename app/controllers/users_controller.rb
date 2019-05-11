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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :email, :password, :icon))
      redirect_to(root_path)
    else
      render(action: :edit)
    end
  end
end
