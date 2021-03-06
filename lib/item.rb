require 'pry'
require 'time'
require 'bigdecimal'

class Item
  attr_reader :id, :name, :description,
              :unit_price, :merchant_id
  attr_accessor :merchant

  def initialize(data)
    @id = data[:id].to_i
    @name = data[:name]
    @description = data[:description]
    @unit_price = data[:unit_price]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @merchant_id = data[:merchant_id].to_i

    @merchant = nil
  end

  def unit_price_to_dollars
    unit_price_as_dollars = @unit_price / 100

    sprintf('%.2f', unit_price_as_dollars)
  end

  def created_at
    Time.parse(@created_at)
  end

  def updated_at
    Time.parse(@updated_at)
  end

  def unit_price
    BigDecimal.new(@unit_price) / 100
  end

  def inspect
    "#<#{self.class}>"
  end

end
