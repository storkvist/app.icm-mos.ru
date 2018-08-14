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
    @kit.images.attach(params[:file]) if params[:file].present?

    if @kit.save
      respond_to do |format|
        format.json { render json: { status: :ok } }
        format.html { redirect_to kits_path, notice: 'Модель обновлена' }
      end
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
    params.require(:kit).permit(:article, :description_en, :description_ru, :name_en, :name_ru, :year, images: [])
  end
end
