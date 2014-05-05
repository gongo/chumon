module ProductsHelper
  def add_to_cart_button(product_id)
    options = { class: 'btn btn-default' }
    value = 'カートに追加する'

    if !session[:cart].nil? && session[:cart].include?(product_id)
      options[:class] += ' disabled'
      options[:disabled] = true
      value = 'この商品は追加済みです'
    end

    button_to value, add_to_cart_path(product_id), options
  end
end
