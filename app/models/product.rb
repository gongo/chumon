# -*- coding: utf-8 -*-

class Product < ActiveRecord::Base
  validates :name, :price, presence: true # name と price は存在すべき
  validates :name, length: { in: 2..100 } # name は2文字以上100文字以内
  validates :price, numericality: { greater_than_or_equal_to: 100 } # 100以上の数値
end
