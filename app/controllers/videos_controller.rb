class VideosController < ApplicationController
  def index
    @pagy, @records = Zype::FetchService.new.search(page_params)
  end

  def show
    @api_key = ENV.fetch("ZYPE_APP_KEY")
    @video_id = params[:id]
  end

  private

    def page_params
      params.permit(:page)
    end
end
