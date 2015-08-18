class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    if params[:mentee] == nil
      @user = :mentor
    else
      @user = :mentee
    end
    params.require(@user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(@user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end

end
