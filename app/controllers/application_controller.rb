class ApplicationController < ActionController::Base
    #current_userをヘルパーメソッドに指定する
    helper_method :current_user
    before_action :login_required

    private

    #もしsession[:user_id]があるとき(ログインしているとき)ユーザー情報を取得してcurrent_userインスタンスに格納
    def current_user
        #(||=) current_userに何も格納されていない時代入
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def login_required
        redirect_to login_path unless current_user
    end
end
