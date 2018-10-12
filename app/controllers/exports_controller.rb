class ExportsController < ApplicationController
  load_and_authorize_resource

  def index
    @exports = @exports.order(created_at: :desc)
  end

  def show
    @kits = @export.kits

    respond_to do |format|
      format.html
      format.json do
        render json: @kits.to_json(only: %i[article barcode year name_en name_ru kit_description_en kit_description_ru
                                            prototype_description_en prototype_description_ru packaging_description_en
                                            packaging_description_ru scale])
      end
      format.xlsx
      format.xml
    end
  end

  def create
    if Export.create(user: current_user, kit_ids: params[:kit_ids])
      redirect_to exports_path
    else
      raise 'Ошибка при выгрузке наборов.'
    end
  end
end
