class Api::V1::HitsController < API::V1::BaseController
  def index
    render json: Hit.all, each_serializer: HitSerializer, status: 200
  end

  def show
    hit = Hit.find(params[:id])
    if (hit)
      render json: hit, serializer: HitSerializer, status: 200
    else
      head 404
    end
  end
end
