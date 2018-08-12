namespace :dev do
  task :fetch_coin => :environment do
    puts "Fetch coinname data..."
    response = RestClient.get "https://api.coinmarketcap.com/v2/listings/",
    :params =>{:key => ""}
    data = JSON.parse(response.body)

    data["data"].each do |c|
      existing_coin = Coin.find_by_coin_id(c["id"])
      if existing_coin.nil?
        Coin.create!(:coin_id => c["id"],:name => c["name"],
          :symbol => c["symbol"])
      end
    end
    puts "Total: #{Coin.count} coins"
  end
end
