class KitsController < ApplicationController
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show; end

  def new; end

  def create
    if @kit.save
      redirect_to edit_kit_path(@kit), notice: 'Модель добавлена'
    else
      render :new
    end
  end

  def edit; end

  def update
    if kit_params[:box_art].present?
      @kit.box_art.attach(kit_params[:box_art])
    end

    if kit_params[:preview].present?
      @kit.preview.attach(kit_params[:preview])
    elsif kit_params[:box_art].present?
      @kit.preview.attach(kit_params[:box_art])
    end

    @kit.assembled_photo.attach(kit_params[:assembled_photo]) if kit_params[:assembled_photo].present?
    @kit.packaging_photo.attach(kit_params[:packaging_photo]) if kit_params[:packaging_photo].present?

    @kit.manual.attach(kit_params[:manual]) if kit_params[:manual].present?

    if @kit.update(kit_params)
      redirect_to edit_kit_path(@kit), notice: 'Модель обновлена'
    else
      render :edit
    end
  end

  def destroy
    @kit.destroy

    redirect_to kits_path, notice: 'Модель удалена'
  end

  private

  def kit_params
    params.require(:kit).permit(:article, :barcode, :assembled_photo, :box_art, :kit_description_en, :kit_description_ru, :manual, :name_en,
                                :name_ru, :packaging_description_en, :packaging_description_ru, :packaging_photo, :preview,
                                :prototype_description_en, :prototype_description_ru, :scale_id, :year, images: [])
  end
end
