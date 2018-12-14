module ControllerHelper
  def login_and_get(action, params = {})
    user = User.first_or_create(attributes_for(:user))
    controller.auto_login(user)
    get(action, params: params)
  end
end
