class GetGiphy

  def self.search_giphy(search_terms)
    # include HTTParty
    # sample giphy api request
    # http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC

    @@url_host_path = "http://api.giphy.com/v1/gifs/search?q="
    @@url_api_key = "&api_key=dc6zaTOxFJmzC"

    @search_terms = search_terms.gsub(/\s/,'+')

    giphy_response = HTTParty.get("#{@@url_host_path}#{@search_terms}#{@@url_api_key}&limit=10")
    # giphy_parsed = JSON.parse(giphy_response)

    # what do we return?

    gif_urls = giphy_response["data"].map do |gif_info|
      gif_info["images"]["original"]["url"]
    end

    return gif_urls

  end

end
