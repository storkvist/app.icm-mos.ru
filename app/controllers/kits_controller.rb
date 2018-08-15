class KitsController < ApplicationController
  load_and_authorize_resource

  def index; end

  def images
    render layout: false
  end

  def new; end

  def create
    if @kit.save
      redirect_to kits_path, notice: 'Модель добавлена'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @kit.update(kit_params)
      redirect_to kits_path, notice: 'Модель обновлена'
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
    params.require(:kit).permit(:article, :kit_description_en, :kit_description_ru, :name_en, :name_ru, :packaging_description_en,
                                :packaging_description_ru, :prototype_description_en, :prototype_description_ru, :year, images: [])
  end
end
