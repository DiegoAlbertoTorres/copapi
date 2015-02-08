class Api::V1::HitsController < API::V1::BaseController
  def index
    render json: Hit.all, each_serializer: HitSerializer, status: 200
  end
end
