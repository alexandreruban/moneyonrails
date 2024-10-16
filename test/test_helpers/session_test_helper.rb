module SessionTestHelper
  def sign_in(user)
    post session_path, params: { email_address: user.email_address, password: "password" }
  end
end
