class Note < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { minimum: 3 }

  validates :title, presence: true,
            length: { minimum: 3 },
            uniqueness: { message: "%{value} já existe" }
end
