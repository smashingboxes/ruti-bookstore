class Book < ActiveRecord::Base
  validates_presence_of :title, :published_date, :author, :price_cents

  has_many :line_items

  monetize :price_cents
  monetize :discount_cents, allow_nil: true
  monetize :discount_price_cents, allow_nil: true

  def discount_price_cents
    price_cents - discount_cents if discounted?
  end

  def discounted?
    return true if discount_cents
  end
end
