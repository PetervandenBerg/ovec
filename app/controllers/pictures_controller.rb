class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :get_project

  # GET /pictures
  # GET /pictures.json
  def index
    @picture_groups = @project.pictures.in_groups_of(3, false)
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = @project.pictures.find(params[:id])
  end

  # GET /pictures/new
  def new
    @project = Project.find(params[:project_id])
    @picture = @project.pictures.build
  end

  # GET /pictures/1/edit
  def edit
    @picture = @project.pictures.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = @project.pictures.build(picture_params)

    respond_to do |format|
      if @picture.save
        format.html { redirect_to project_pictures_url(@project), notice: 'Picture was successfully created.' }
        format.json { render action: 'show', status: :created, location: @picture }
      else
        format.html { render action: 'new' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    @picture = @project.pictures.find(params[:id])

    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to project_pictures_url(@project), notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture = @project.pictures.find(params[:id])
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to (project_pictures_path(@project)) }
      format.json { head :no_content }
    end
  end

  private

    def get_project
      @project = Project.find(params[:project_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:title, :project_id, :image)
    end
end
