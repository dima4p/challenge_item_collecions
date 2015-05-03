# This is the main controller to process model MediaItem
#
class MediaItemsController < ApplicationController

  # before_action :set_media_item, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /media_items
  # GET /media_items.json
  def index
    # @media_items = MediaItem.all
    respond_to do |format|
      format.html do
        @grid = initialize_grid @media_items
      end
      format.json do
        @media_items = @media_items.page(params[:page]) if params[:page].present?
        @media_items = @media_items.per(params[:per_page]) if params[:per_page].present?
      end
    end
  end

  # GET /media_items/1
  # GET /media_items/1.json
  def show
  end

  # GET /media_items/new
  def new
    # @media_item = MediaItem.new
  end

  # GET /media_items/1/edit
  def edit
  end

  # POST /media_items
  # POST /media_items.json
  def create
    # @media_item = MediaItem.new(media_item_params)

    respond_to do |format|
      if @media_item.save
        format.html { redirect_to media_item_path(@media_item), notice: t('media_items.was_created') }
        format.json { render :show, status: :created, location: @media_item }
      else
        format.html { render :new }
        format.json { render json: @media_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media_items/1
  # PATCH/PUT /media_items/1.json
  def update
    respond_to do |format|
      if @media_item.update(media_item_params)
        format.html { redirect_to media_item_path(@media_item), notice: t('media_items.was_updated') }
        format.json { render :show, status: :ok, location: @media_item }
      else
        format.html { render :edit }
        format.json { render json: @media_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_items/1
  # DELETE /media_items/1.json
  def destroy
    @media_item.destroy
    respond_to do |format|
      format.html { redirect_to media_items_url, notice: t('media_items.was_deleted') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_media_item
  #   @media_item = MediaItem.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def media_item_params
    list = [
      :name, :type, :user_id, :link, :image
    ]
    params.require(:media_item).permit(*list)
  end
end
