class CashRegister
    attr_accessor :total, :discount, :last_transaction
  
    def initialize(discount = nil)
      @total = 0
      @discount = discount
      @items = []
    end
  
    def add_item(title, price, quantity = 1)
      self.last_transaction = price * quantity
      @total += self.last_transaction
      quantity.times { @items << title }
    end
  
    def apply_discount
      return "There is no discount to apply." unless self.discount
      self.total = (self.total * (100.0 - self.discount) / 100).to_i
      "After the discount, the total comes to $#{self.total}."
    end
  
    def items
      @items
    end
  
    def void_last_transaction
      self.total -= self.last_transaction
      @items.pop
    end
  end