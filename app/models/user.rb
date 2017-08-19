class User < ActiveRecord::Base
  has_secure_password

  has_many :ideas, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :ideas

  before_save :downcase_input

  validates :name, presence: true, length: { in: 2..30 }
  validates :alias, presence: true, uniqueness: true, length: { in: 2..30 }
  validates_format_of :name, :alias, with: /\A[-a-z]+\Z/i
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :password, length: { minimum: 8 }

  def downcase_input
    self.name.downcase!
    self.alias.downcase!
    self.email.downcase!
  end
end
