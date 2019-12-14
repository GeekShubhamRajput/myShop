class User < ActiveRecord::Base
  acts_as_token_authenticatable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

end
