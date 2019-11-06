class ApplicationController < ActionController::Base


  protect_from_forgery with: :exception
  #クロスサイトリクエストフォージェリ（CSRF）への対応策のコード

  before_action :authenticate_user! #アクションの前にサインインが必須
  before_action :configure_permitted_parameters, if: :devise_controller? #configure_permitted_parametersメソッドはdevice_controllererを使う時しか処理しない

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

end
