require 'time'

class Customer
  attr_reader :id, :first_name, :last_name,
              :created_at, :updated_at
  attr_accessor :invoices, :merchants

  def initialize(data)
    @id = data[:id].to_i
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @created_at = Time.parse(data[:created_at])
    @updated_at = Time.parse(data[:updated_at])
    @merchants = []
    @invoices = []
  end

  def inspect
    "#<#{self.class}>"
  end

end
