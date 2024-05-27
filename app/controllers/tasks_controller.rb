class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Tarefa criada com sucesso!"
    else
      render :new, alert: "Erro ao criar a tarefa."
    end
  end

  def update
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "Tarefa excluída com sucesso!"
  end

  private

  def task_params
    params.require(:task).permit(:name, :due_date, :completed)
  end
end
