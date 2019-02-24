class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  protected

  def after_sign_up_path_for(_resource)
    URI.parse(request.referer).path if request.referer
  end
end
