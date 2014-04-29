# -*- coding: utf-8 -*-

class Product < ActiveRecord::Base
  validates :name, :price, presence: true # name と price は存在すべき
  validates :name, length: { minimum: 2 } # name は最低でも二文字以上
end
