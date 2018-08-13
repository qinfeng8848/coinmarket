namespace :dev do
  task :fetch_coin => :environment do


    puts "Fetch coinname data..."
    response = RestClient.get "https://api.coinmarketcap.com/v1/ticker",
    :params =>{:convert=>"CNY",:limit=>"100",:key => ""}
    data = JSON.parse(response.body)

    data.each do |c|


      existing_coin = Coin.find_by_coin_id(c["id"])

      if existing_coin.nil?

        Coin.create!(:coin_id => c["id"],:name => c["name"],
          :symbol => c["symbol"],:rank => c["rank"],
        :price_cny => c["price_cny"],
        :percent_change_24h => c["percent_change_24h"])
      else

      end
    end
    puts "Total: #{Coin.count} coins"
  end
end
