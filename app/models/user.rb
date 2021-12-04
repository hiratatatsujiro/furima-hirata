class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items

  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :last_name_reading
    validates :first_name_reading
    validates :birthday
  end

  
end
