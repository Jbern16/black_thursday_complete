require_relative 'customer'
require 'pry'
require_relative 'csv_loader'

class CustomerRepository

  attr_accessor :customers

  include CsvLoader

  def from_csv(file_path)
    unless file_path.nil?
      @customers = load(file_path).map do |customer|
        Customer.new(customer)
      end
    end
  end

  def all
    customers
  end

  def find_by_id(customer_id)
    customers.find do |customer|
      customer.id.to_i == customer_id.to_i
    end
  end

  def find_all_by_last_name(last_name)
    customers.select do |customer|
      customer.last_name == last_name
    end
  end

  def find_all_by_first_name(first_name)
    customers.select do |customer|
      customer.first_name == first_name
    end
  end

end
