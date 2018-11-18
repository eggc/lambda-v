class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(params.require(:session).permit(:email, :password))

    if @session.validate && login(@session.email, @session.password)
      redirect_back_or_to(home_path)
    else
      render(action: :new)
    end
  end

  def destroy
    logout
    redirect_to(root_path)
  end
end
