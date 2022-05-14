class Recipe < ApplicationRecord
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :name, presence: true
  validates :photo, presence: true
  validates :prep, presence: true
  validates :cook, presence: true
  validates :direction, presence: true
  validates :ingredient, presence: true
  attribute :user_id
  attribute :category_id
  belongs_to :category
  belongs_to :user

end
