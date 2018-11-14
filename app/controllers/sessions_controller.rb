class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(params.require(:session).permit(:email, :password))

    if @session.validate && login(@session.email, @session.password)
      redirect_to(root_path)
    else
      render(action: :new)
    end
  end
end
