class Api::V1::HitsController < API::V1::BaseController
  def index
    render json: Hit.all, each_serializer: HitSerializer, status: 200
  end

  def show
      if params[:minTime]
		hits = hits.where("created_at > ?", params[:minTime].to_datetime)
		if params[:maxTime]
			hits = hits.where("created_at < ?", params[:maxTime].to_datetime)
		end
	  end
	  if params[:minLat] and params[:maxLat]
		hits = hits.where("latitude > ? AND latitude < ?", params[:minLat], params[:maxLat])
	  end
	  if params[:minLong] and params[:maxLong]
	  	hits = hits.where("longitud > ? AND longitud < ?", params[:minLong], params[:maxLong])
	  end
	  if params[:report]
		hits = hits.where("report LIKE ?", params[:report])
	  end
	  render json: hits, serializer: HitSerializer, status: 200
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
    params.require(:hit).permit(:minLat, :maxLat, :minLong, :maxLong, :report, :minTime, :maxTime, :user_id)
  end
end
