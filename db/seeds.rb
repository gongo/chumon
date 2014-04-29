#
# 商品のテストデータ
#
('A'..'Z').each do |name|
  Product.create(name: "商品#{name}", price: [100, 200, 300, 400].sample)
end

#
# 注文明細のテストデータ
#
products = Product.all.to_a
100.times do
  OrderDetail.create(product: products.sample, count: (1..10).to_a.sample)
end
