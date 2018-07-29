class RegistrationsController < Devise::RegistrationsController
  # deviseでユーザーの名前の登録を許可する
  before_action :configure_permitted_parameters, if: :devise_controller?

  # アカウント編集後にリダイレクトするパスを変更
  def after_update_path_for(resource)
    dashbords_home_path
  end

  # deviseでユーザーの名前の登録を許可する
  def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) << :name
  devise_parameter_sanitizer.for(:account_update) << :name
  end

  protected

  # アカウント編集画面で現在のパスワードの入力を不要とする
  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  private

  # Storong Parameters
  #ログインページ
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  #アカウント編集ページ
  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

end
