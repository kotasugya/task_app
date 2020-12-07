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
  end

  def update
  end
  
  def delete 
  end

#for security from here
  private

  def task_params
    params.require(:task).permit(:title, :start_day, :finish_day, :time, :schedule_memo)
  end
  
end
