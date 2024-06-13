class RegistrationsController < Devise::RegistrationsController
  def create
    super
    flash[:notice] = "Signed in successfully."
  end
end