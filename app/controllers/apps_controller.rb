class AppsController < ApplicationController

  def show
    @app = App.find_by_pub_id(params[:pub_id])
    render json: @app
  end

  def index
    render json: App.all
  end

  def create
    app = App.new(app_params)
    if app.save
      render json: app, status: :created
    else
      render_error(app, :unprocessable_entity)
    end
  end

  def app_params
    params.require(:app).permit(:url, :pub_id, :client_id, :client_secret)
  end
end