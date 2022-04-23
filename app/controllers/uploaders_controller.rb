class UploadersController < ApplicationController
  before_action :set_uploader, only: %i[ show edit update destroy ]

  # GET /uploaders or /uploaders.json
  def index
    @uploaders = Uploader.where(user: current_user)
  end

  # GET /uploaders/1 or /uploaders/1.json
  def show
    redirect_to root_path unless @uploader
  end

  # GET /uploaders/new
  def new
    @uploader = Uploader.new
  end

  # GET /uploaders/1/edit
  def edit
  end

  # POST /uploaders or /uploaders.json
  def create
    @uploader = Uploader.new(uploader_params)

    respond_to do |format|
      if @uploader.save
        format.html { redirect_to uploader_url(@uploader), notice: "Uploader was successfully created." }
        format.json { render :show, status: :created, location: @uploader }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @uploader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uploaders/1 or /uploaders/1.json
  def update
    respond_to do |format|
      if @uploader.update(uploader_params)
        format.html { redirect_to uploader_url(@uploader), notice: "Uploader was successfully updated." }
        format.json { render :show, status: :ok, location: @uploader }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @uploader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploaders/1 or /uploaders/1.json
  def destroy
    @uploader.destroy

    respond_to do |format|
      format.html { redirect_to uploaders_url, notice: "Uploader was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def delete_file
    file = ActiveStorage::Attachment.find(params[:id])
    file.purge
    redirect_back(fallback_location: root_path)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_uploader
    @uploader = Uploader.find_by(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def uploader_params
    params.require(:uploader).permit(:title, :description, :user_id, files: [])
  end
end
