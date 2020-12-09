class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show 
    @task = Task.find(params[:id])
  end
  
  def new 
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "登録が完了しました"
      redirect_to(root_path)
    else
      flash[:danger] = "登録に失敗しました"
      render "new"
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "スケジュールを更新しました"
      redirect_to(@task)
    else
      render "new"
    end
  end
  
  def destroy
    @task = Task.find(params:id)
		@task.destroy
		
		flash[:success] = "スケジュールを削除しました"
		redirect_to(tasks_path)
  end

#for security from here
  private

  def task_params
    params.require(:task).permit(:title, :start_day, :finish_day, :time, :schedule_memo)
  end
  
end
