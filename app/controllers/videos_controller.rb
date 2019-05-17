class VideosController < ApplicationController
  def index
    @pagy, @records = Zype::FetchService.new.search(page_params)
  end

  private

    def page_params
      params.permit(:page)
    end
end
