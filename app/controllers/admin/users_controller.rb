class Admin::UsersController < ApplicationController
  #ユーザーの一覧画面
  def index
    #Userテーブルの情報を全て取得して@usersに格納
    @users = User.all
  end

  #ユーザーの詳細画面
  def show
    #Userテーブルの中からidが一致する情報を探して@userに格納
    @user = User.find(params[:id])
  end

  #ユーザーの新規登録画面
  def new
    #インスタンスを作成
    @user = User.new
  end


  #ユーザーの編集画面
  def edit
    #paramsに格納したidと一致する情報をUseモデルの中から探して@userに格納
    @user = User.find(params[:id])
  end

  #登録アクション
  def create
    #ユーザーの登録情報を格納したものを@userに代入
    @user = User.new(user_params)
    #＠userが保存できる(空のカラムが無い)とき
    if @user.save
    #admin_users_pathに移動
      redirect_to admin_users_path, notice: "ユーザー「#{@user.name}」を登録しました。"
    else
    #新規登録画面を再び表示する
      render :new
    end
  end
  
  #更新を行う
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice:'ユーザー「#{@user.name}」を更新しました。'
    else
      render :new
    end
  end
  
  #削除を行う
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url, notice: "ユーザー"
  end
  
private
  #もし管理者権限がなかった場合トップ画面にリダイレクトする
  def require_admin
    redirect_to root_path unless current_user.admin?
  end

  def user_params
    #送られてきた情報をuserテーブルのnameモデル以下として取得する
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
end
