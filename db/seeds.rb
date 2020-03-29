
#1. 以下はExchnageRateをゲットするためのもの
require 'net/http'
require 'uri'
require 'json'

uri = URI.parse('http://www.apilayer.net/api/live?access_key='+ ENV['API_KEY'] +'&currencies=USD,JPY,GBP,AUD&format=1') # I reset my own api access key at https://currencylayer.com/. Please make your own key and replace with it
json = Net::HTTP.get(uri) #NET::HTTPを利用してAPIを呼ぶ
result = JSON.parse(json) #返ってきたjsonデータをrubyの配列に変換するためのライン
date_validation = Exchange.find(5).created_at.strftime("%d/%m/%Y")

def history_creation(date_validation)
  # create fx hist
    if FxHistory.pluck(:value_date).include?(date_validation)
      nil
    else
      Exchange.all.each do |e|
      FxHistory.create(currency: e.currency, rate: e.rate, value_date: e.created_at.strftime("%d/%m/%Y"))
      end
    end 
  # create port hist
  if PortHistory.pluck(:value_date).include?(date_validation)
    nil
  else
    PortHistory.create(home_amt: Portfolio.pluck(:home_amt).sum, value_date: date_validation)
  end
end

history_creation(date_validation)


byebug
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

def revaluation
      Portfolio.all.each do |p|
      p.update(:home_amt => (p.local_amt/Exchange.find(p.exchange_id).rate).round(3))
      end
end

revaluation()

# c1 = Exchange.find(6)
# c2 = Exchange.find(5)

# p1 = Portfolio.create(:local_amt => 4000000, :home_amt => 0, :exchange_id => c1.id)
# p2 = Portfolio.create(:local_amt => 20000, :home_amt => 0, :exchange_id => c2.id)
# p1.update(:home_amt => (p1.local_amt/Exchange.find(p1.exchange_id).rate).round(3))
# p2.update(:home_amt => (p2.local_amt/Exchange.find(p2.exchange_id).rate).round(3))
