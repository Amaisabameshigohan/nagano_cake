class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :email
    validates :encrypted_password
    validates :postal_code
    validates :address
    validates :telephone_number
  end


  def active_for_authentication?
    super && (is_deleted == false)
  end

end
