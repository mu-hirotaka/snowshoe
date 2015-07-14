class StampController < ApplicationController
  SNOWSHOE_APP_KEY = "e59336c647a10a2699e6"
  SNOWSHOE_APP_SECRET = "0eaf9fd9cacc1ef7e07ecc94607ac1d054b0ba83"
  def post
    client = Snowshoe::Client.new(SNOWSHOE_APP_KEY, SNOWSHOE_APP_SECRET)
    data = { "data" => params["data"] }
    response = client.post(data)
    logger.debug response
    if response.include? "stamp"
      render json: '{"magic_asset": "http://mydomain.com/super/cool/asset}' 
    else
      render json: '{"error_asset": "http://mydomain.com/try/again/asset"}' 
    end
  end
end
