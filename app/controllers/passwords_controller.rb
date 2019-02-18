class PasswordsController < Devise::PasswordsController
  def new
    @categorys = Category.all
    super
  end

  def create
    redirect_to root_path
  end

  protected

  def after_sending_reset_password_instructions_path_for(_resource_name)
    URI.parse(request.referer).path if request.referer
  end
end
