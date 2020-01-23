
#1. 以下はExchnageRateをゲットするためのもの
require 'net/http'
require 'uri'
require 'json'

uri = URI.parse('http://www.apilayer.net/api/live?access_key=d472b0aa4dbe0894022c08656f86a91e&currencies=USD,JPY,GBP,AUD&format=1') #http = URI. URLとURIの違いは握り寿司と握りと呼んで良いのと同じくらいの差
json = Net::HTTP.get(uri) #NET::HTTPを利用してAPIを呼ぶ
result = JSON.parse(json) #返ってきたjsonデータをrubyの配列に変換するためのライン

# 2.ここからはデータベースに取得したレートを保存するためのもの
result['quotes'].each do |key, value|
    if Exchange.find_by(currency: key)
      rate = Exchange.find_by(currency: key)
      rate.update(rate: value)
    else
      Exchange.create(currency: key, rate: value)
    end
  end

# 3.GBPベースでないので計算
 new_base_currency_gbp_rate = result['quotes']['USDGBP']
 result_base_currency_gbp = result['quotes'].map{|key,value| [key, (value/new_base_currency_gbp_rate).round(4)]}.to_h #GBPをGBPで割ってしまうためUSDGBPレートが１に塗り変わってしまうが先頭のUSDUSDがGBPの元になる
 result_base_currency_gbp_with_right_key_name = result_base_currency_gbp.map{|key,value| ["GBP" + key.slice(3,6), value]}.to_h # keynameの調整
 
# 4.3をdbにセーブ
 result_base_currency_gbp_with_right_key_name.each do |key, value|
    if Exchange.find_by(currency: key)
      rate = Exchange.find_by(currency: key)
      rate.update(rate: value)
    else
      Exchange.create(currency: key, rate: value)
    end
  end

# 不要なUSDを消去
usd_base = Exchange.where("currency LIKE ?","USD%")
usd_base.destroy_all


c1 = Exchange.find(6)
c2 = Exchange.find(5)

p1 = Portfolio.create(:local_amt => 4000000, :home_amt => 0, :exchange_id => c1.id)
p2 = Portfolio.create(:local_amt => 20000, :home_amt => 0, :exchange_id => c2.id)
p1.update(:home_amt => (p1.local_amt/Exchange.find(p1.exchange_id).rate).round(3))
p2.update(:home_amt => (p2.local_amt/Exchange.find(p2.exchange_id).rate).round(3))