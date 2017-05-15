require_relative './factory'

Customer = Factory.new(:name, :address, :zip)

joe = Customer.new('Joe Smith', '123 Maple, Anytown NC', 123_45)

p joe
p joe['name']
p joe[:address]
p joe[2]

Recipient = Factory.new(:name, :address) do
  def greeting
    puts "Hello #{name}"
  end
end

Recipient.new('Dave', '123 Main').greeting
