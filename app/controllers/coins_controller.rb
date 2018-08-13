class CoinsController < ApplicationController
  def index
    @coins = Coin.all
  end

  def update_rank
    coin = Coin.find(params[:id])
    response = RestClient.get "https://api.coinmarketcap.com/v1/ticker",
    :params =>{:convert=>"CNY",:limit=>"100",:key => ""}

    data = JSON.parse(response.body)
    data.each do |c|
       if coin.coin_id == c["id"]
         coin.update(:price_cny => c["price_cny"],:rank => c["rank"],
           :percent_change_24h => c["percent_change_24h"])
       end
    end
    redirect_to coins_path
  end



end
