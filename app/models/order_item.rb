class OrderItem < ApplicationRecord
  validates :qty, presence: true, numericality: { only_integer: true }
  validates :shipped, presence: true

  belongs_to :product
  belongs_to :order


  def subtotal
    return self.product.price * qty
  end

  private



end
