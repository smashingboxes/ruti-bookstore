class Book < ActiveRecord::Base
  validates_presence_of :title, :published_date, :author, :price
  default_scope { order(published_date: :desc) }

  has_many :line_items

  monetize :price_cents

  def discount_price
    price_cents - discount_cents
  end
end
