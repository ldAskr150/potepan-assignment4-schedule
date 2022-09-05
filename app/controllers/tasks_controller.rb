class TasksController < ApplicationController
  before_action :today_date
  
  def today_date
    @today_date = Time.zone.now
  end
  
  def index
    @page_title = "スケジュール一覧"
    @tasks = Task.all
  end

  def show
    @page_title = "スケジュール詳細"
    @task = Task.find(params[:id])
  end

  def new
    @page_title = "スケジュール新規作成"
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(
      :title,
      :description,
      :start,
      :finish,
      :allday
    ))
    if @task.save
      flash[:success] = "スケジュールを登録しました"
      redirect_to tasks_path
    else
      flash.now[:failure] = "スケジュールを登録できませんでした"
      render "new"
    end
  end

  def edit
    @page_title = "スケジュール編集"
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(params.require(:task).permit(
      :title,
      :description,
      :start,
      :finish,
      :allday
    ))
      flash[:success] = "スケジュールを更新しました"
      redirect_to :tasks
    else
      flash.now[:failure] = "スケジュールを更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "スケジュールを削除しました"
    redirect_to :tasks
  end
  
  private
  
  def task_params
    params.require(:task).permit(
        :title,
        :description,
        :start,
        :finish,
        :allday
      )
  end
end
