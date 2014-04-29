#
# 商品のテストデータ
#
('A'..'Z').each do |name|
  Product.create(name: "商品#{name}", price: [100, 200, 300, 400].sample)
end

30.times do
  products = Product.all.shuffle
  order = Order.new

  # 注文一つにつき3-5個のつまり商品を登録
  (3..5).to_a.sample.times do
    order.order_details.build(product: products.shift, count: (1..4).to_a.sample)
  end

  order.save
end
