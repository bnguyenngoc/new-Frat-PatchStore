class Admin::PatchTypesController < ApplicationController
  # GET /patch_types
  # GET /patch_types.json
  def index
    @patch_types = PatchType.all
  end

  # GET /patch_types/1
  # GET /patch_types/1.json
  def show
  end

  # GET /patch_types/new
  def new
    @patch_type = PatchType.new
  end

  # GET /patch_types/1/edit
  def edit
    @patch_type = PatchType.find(params[:id])
  end

  # POST /patch_types
  # POST /patch_types.json
  def create
    @patch_type = PatchType.new(patch_type_params)
    respond_to do |format|
      if @patch_type.save
        format.html { redirect_to admin_patch_types_path, notice: 'Patch type was successfully created.' }
        format.json { render :index, status: :created, location: @patch_type }
      else
        format.html { render :new }
        format.json { render json: @patch_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patch_types/1
  # PATCH/PUT /patch_types/1.json
  def update
    @patch_type = PatchType.find(params[:id])
    respond_to do |format|
      if @patch_type.update(patch_type_params)
        format.html { redirect_to admin_patch_types_path, notice: 'Patch type was successfully updated.' }
        format.json { render :index, status: :ok, location: @patch_type }
      else
        format.html { render :edit }
        format.json { render json: @patch_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patch_types/1
  # DELETE /patch_types/1.json
  def destroy
    @patch_type = PatchType.find(params[:id])
    respond_to do |format|
      if @patch_type.destroy
        format.html { redirect_to patch_types_url, notice: 'Patch type was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html {render :index, notice: "Error deleting patch"}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patch_type
      @patch_type = PatchType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patch_type_params
      params.require(:patch_type).permit(:name, :description)
    end
end