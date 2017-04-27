class GraphController < ApplicationController
  def index; end

  def data
    respond_to do |format|
      format.json do
        render json: [1, 2, 3, 4, 9]
      end
    end
  end
end
