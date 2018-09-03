class ScalesController < ApplicationController
  load_and_authorize_resource

  def index
    @scales = @scales.order_by_name
  end
end
