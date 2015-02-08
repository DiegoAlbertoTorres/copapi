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

  def create
    hit = Hit.new(hit_params)

    if hit.save
      render json: hit, serializer: HitSerializer, status: 200
    else
      render json: { hit: { errors: hit.errors.full_messages } }, status: 422
    end
  end

  private

  def hit_params
    params.require(:hit).permit(:latitude, :longitud, :report, :user_id)
  end
end
