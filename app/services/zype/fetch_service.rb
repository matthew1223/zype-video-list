require 'pagy'
require 'rest-client'

module Zype
  class FetchService
    include Pagy::Backend

    ZYPE_BASE_API = 'https://api.zype.com'
    def initialize
      @api_key = ENV.fetch("ZYPE_APP_KEY")
    end

    def search(params)
      response = RestClient.get(url(params), headers={})
      json = JSON.parse(response.body)

      pagy = Pagy.new(pagy_options(json["pagination"]))
      [pagy, json["response"]]
    end

    private
      def url(params)
        "#{ZYPE_BASE_API}/videos?app_key=#{@api_key}&page=#{params[:page]}"
      end

      def pagy_options(pagination)
        {
          page: pagination["current"],
          items: pagination["per_page"],
          count: pagination["pages"] * pagination["per_page"],
          offset: 0
        }
      end
  end
end