class RegistrationsController < Devise::RegistrationsController

  def new
    # @categorys = Category.all
    super
  end

  protected

  def after_sign_up_path_for(resource)
    URI.parse(request.referer).path if request.referer
  end
end
