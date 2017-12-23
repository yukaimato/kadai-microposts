class User < ApplicationRecord
  # 入力された email を小文字に強制的に変換をする
  # self.email = 「入力された email」
  # .downcase! = 「小文字に強制的に変換をする」
  # なので self.email.upcase! → 大文字
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
end