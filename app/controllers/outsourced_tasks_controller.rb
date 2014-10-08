class OutsourcedTasksController < ApplicationController
  before_action :set_project, only: [:index, :new, :create]
  before_action :set_outsourced_task, only: [:show, :edit, :update, :destroy]

  # GET /outsourced_tasks/1
  # GET /outsourced_tasks/1.json
  def show
  end

  # GET /outsourced_tasks/new
  def new
    @outsourced_task = OutsourcedTask.new
  end

  # GET /outsourced_tasks/1/edit
  def edit
  end

  # POST /outsourced_tasks
  # POST /outsourced_tasks.json
  def create
    @outsourced_task = @project.outsourced_tasks.new(outsourced_task_params)

    respond_to do |format|
      if @outsourced_task.save
        format.html { redirect_to @outsourced_task.project, notice: 'Outsourced task was successfully created.' }
        format.json { render action: 'show', status: :created, location: @outsourced_task }
      else
        format.html { render action: 'new' }
        format.json { render json: @outsourced_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outsourced_tasks/1
  # PATCH/PUT /outsourced_tasks/1.json
  def update
    respond_to do |format|
      if @outsourced_task.update(outsourced_task_params)
        format.html { redirect_to @outsourced_task.project, notice: 'Outsourced task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @outsourced_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outsourced_tasks/1
  # DELETE /outsourced_tasks/1.json
  def destroy
    @outsourced_task.destroy
    respond_to do |format|
      format.html { redirect_to project_url(@outsourced_task.project) }
      format.json { head :no_content }
    end
  end

  private
    def set_project
      @project = current_user.projects.friendly.find(params[:project_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_outsourced_task
      @outsourced_task = OutsourcedTask.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outsourced_task_params
      params.require(:outsourced_task).permit(:name, :estimated_cost, :actual_cost, :charged_to_client)
    end
end
