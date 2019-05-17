module Zype
  class FetchService
    def initialize
      @api_key = ENV.fetch("ZYPE_APP_KEY")
    end
  end
end