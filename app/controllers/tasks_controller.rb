class TasksController < ApplicationController
  #privateメソッドのset_taskアクションを[]内に適用
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  #タスク一覧画面
  def index
    #ログインしているユーザーに紐づくタスクのみ表示
    @tasks = current_user.tasks
  end

  #タスク詳細画面
  def show
    #ログインしているユーザーに紐づくタスクのみ表示
    #@task = current_user.tasks.find(params[:id])
  end
  
  #新規作成画面
  def new
    @task = Task.new
  end
  
  #タスク登録画面
  def create
      #task_paramsメソッドを引数にしてインスタンスを作成することでデータを引き継いで表示する
    @task = current_user.tasks.new(task_params)
      #条件分岐をするためsaveではなくsave!を使う
    if @task.save
      #一覧画面にリダイレクトする
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      #newページ(登録用フォーム画面)を再び表示
      render :new
    end
  end
  
  #タスクの編集画面
  def edit
    #@task = current_user.tasks.find(params[:id])
  end
  
  #タスクの更新
  def update
    #task = current_user.tasks.find(params[:id])
    @task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を更新しました。"
  end
  
  #タスクの削除
  def destroy
    #task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  end
  

  private
  
  def task_params
    #taskテーブルのname,descriptionモデルを変更
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
