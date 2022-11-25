class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  has_one_attached :image
  enum is_active: { sale: true, stop_selling: false }

  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

  def self.search(search)
    if search != ""
      Item.where(['name LIKE(?) OR genre_id LIKE(?)', "%#{search}%", "%#{search}%"])
    else
      Item.all
    end
  end
end
