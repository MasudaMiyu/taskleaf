class SessionsController < ApplicationController
  skip_before_action :login_required
  #ログインフォーム画面(GET)
  def new
  end

  #フォームから送られてきた情報をもとにログインする(POST)
  def create
    #session_paramsに格納した情報のうちメールアドレスを取得しUserテーブルのemailカラムと一致するメールアドレスを検索する
    user = User.find_by(email: session_params[:email])
    #authanticateメソッドでパスワード認証が通ったとき
          #has_secure_passwordで使えるようになる
          #&.でuserがnilの時'nil'を返してエラー回避
    if user&.authenticate(session_params[:password])
    #sessionにuser_idを格納
      session[:user_id] = user.id
    #
      redirect_to root_path, notice: 'ログインしました。'
    else
      render :new
    end
  end

  def destroy
    #セッション情報を削除
    reset_session
    redirect_to root_path, notice: 'ログアウトしました'
  end

  private
  #送られてきたセッションのemailカラムとpasswordカラムの情報を取得する
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
