class API::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  respond_to :json

  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token,options|
      @authenticated_user = User.find_by(auth_token: token)
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: { errors: ['Unauthorized'] }, status: 401
  end

  def authenticated_user
    @authenticated_user
  end
  helper_method :authenticated_user

  def match_route_with_authenticated_user
    unless authenticated_user.id == params[:id].to_i || authenticated_user.id == params[:user_id].to_i
      render json: { user:  { errors: ["User id doesn't match the user authenticated by the token"]}}, status: 422
    end
  end

  def per_page_param(per_page, default)
    unless per_page
      return default
    end
    return per_page.to_i
  end

  def pagination_json(paginated_array, per_page)
    size = paginated_array.size
    total_pages = (size.to_f/per_page.to_f).ceil
    { pagination: { per_page: per_page, total_pages: total_pages, total_objects: size } }
  end
end
