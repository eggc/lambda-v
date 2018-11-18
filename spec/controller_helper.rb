module ControllerHelper
  def login_and_get(action, params = {})
    user = User.first_or_create(email: 'alice@example.com', password: '3bt2[J!')
    controller.auto_login(user)
    get(action, params: params)
  end
end
