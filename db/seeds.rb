# User初期マスタ
User.create(email: "admin@example.com", password: "11111111", password_confirmation: "11111111", name: "Admin", admin: "t")
# Customer初期マスタ
Customer.create(customer_name: "アップル", postal_code: "106-6140", business: "その他", prefectures: "東京都", city: "港区", town_name: "六本木6丁目10番1号 六本木ヒルズ", phone_number: "0120-993-993", fax_number: "0120-993-994", url: "https://www.apple.com/jp/", image: "apple.png" )

# Store初期マスタ
@customer = Customer.find(1)
@customer.stores.create(
  store_code: "000001",
  store_name: "心斎橋店",
  postal_code: "542-0086",
  prefectures: "大阪府",
  city: "大阪市中央区",
  town_name: "西心斎橋1-5",
  phone_number: "06-4963-4500",
  fax_number: "06-4963-4501",
  business_hours_start: "10:00",
  business_hours_end: "21:00",
  pos_type: "iPad",
  ip_address: "10.0.0.1",
  remarks: "初期マスタ"
)
# Ticket初期マスタ
@store = Store.find(1)
@store.tickets.create(
  title: "Ruby on Railsを勉強したい",
  status: "未対応",
  sender: "オカダ",
  received_user_id: "1",
  assign_user_id: "1",
  receive_date: Date.today,
  receive_time: Time.now,
  limit_date: "2018-12-31",
  content: "Ruby on Railsを勉強したいがどうすればいいか。",
  detail: "ここに対応内容を記載。",
  result: "ここに対応結果を記載。",
  remarks: "初期マスタ"
)

# Userテストデータ
5.times do |i|
  User.create(
    email: "user#{i}@example.com",
    password: "11111111",
    password_confirmation: "11111111",
    name: "user#{i}",
    admin: "f"
  )
end

# Customerテストデータ
business = %w[ドラッグストア スーパーマーケット 総合スーパー アパレル 専門店 コンビニ その他]
prefectures = %w[東京都 東京都 宮城県 東京都 愛知県 福岡県 大阪府]
city = %w[中央区 渋谷区 仙台市青葉区 渋谷区 名古屋市中区 福岡市中央区 大阪市中央区]
town_name = %w[銀座3 神南1 一番町 神宮前4 栄3 天神2 心斎橋]
0.upto(6) do |idx|
  Customer.create(
    customer_name: "株式会社サムライ#{idx}",
    postal_code: "100-123#{idx}",
    business: "#{business[idx]}",
    prefectures: "#{prefectures[idx]}",
    city: city[idx],
    town_name: town_name[idx],
    phone_number: "03-1234-987#{idx}",
    fax_number: "03-1234-789#{idx}",
    url: "http://www.samurai#{idx}.com"
  )
end

# Storeテストデータ
pos_type = %w[iPhone iPad Surface]
0.upto(6) do |idx|
  Store.create(
    customer_id: rand(1..8),
    store_code: rand(100000..999999),
    store_name: prefectures[idx].to_s.chop + "店",
    postal_code: "100-008#{idx}",
    prefectures: prefectures[idx],
    city: city[idx],
    town_name: town_name[idx],
    phone_number: "03-1234-987#{idx}",
    fax_number: "03-1234-789#{idx}",
    business_hours_start: "10:00",
    business_hours_end: "21:00",
    pos_type: pos_type.sample,
    ip_address: "192.168.0.1#{idx}",
    remarks: "テストデータ"
  )
end

# Ticketテストデータ
sender = %w[ヤマモト サトウ イノウエ ワタナベ イトウ]
def rand_date(d_from,d_to)
    from = Date.parse(d_from)
    to = Date.parse(d_to)
    days = to - from + 1
    return from + rand(days)
end
0.upto(50) do |idx|
  Ticket.create(
    store_id: rand(1..8),
    title: "タイトル#{idx}",
    status: "未対応",
    sender: sender.sample,
    received_user_id: rand(1..6),
    assign_user_id: rand(1..6),
    receive_date: rand_date("2017-12-01", "2018-3-31"),
    receive_time: Time.now,
    limit_date: rand_date("2017-12-01", "2018-3-31"),
    content: "問合せ内容#{idx}",
    detail: "対応内容#{idx}",
    result: "対応結果#{idx}",
    remarks: "テストデータ"
  )
end
