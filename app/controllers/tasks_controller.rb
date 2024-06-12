class TasksController < ApplicationController
    def new
    	@task = Task.new
  	end

  	def index
  		@tasks = current_user.tasks
  	end

  	def show
    	@task = Task.find(params[:id])
  	end

    def create
        @task = current_user.tasks.build(task_params)
        if @task.save
            redirect_to tasks_path, notice: 'Task was successfully created.'
        else
            render :new
        end
    end

	def edit
		@task = Task.find(params[:id])
	end    
	
	def update
 		@task = Task.find(params[:id])
		if @task.update(task_params)
			DeadlineAlertJob.perform_now(@task.id)
			redirect_to @task, notice: 'Task was successfully updated.'
		else
			render :edit
		end
	end

  	private

  	def task_params
    	params.require(:task).permit(:title, :description, :status, :deadline)
  	end
end
