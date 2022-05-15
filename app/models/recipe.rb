class Recipe < ApplicationRecord
  VALID_NUMBER = /\d/i.freeze
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :name, presence: true
  validates :photo, presence: true
  validates :prep, presence: true,format: { with: VALID_NUMBER }
  validates :cook, presence: true, format: { with: VALID_NUMBER }
  validates :direction, presence: true
  validates :ingredient, presence: true
  validates :country, presence: true
  attribute :user_id
  attribute :category_id
  belongs_to :category
  belongs_to :user

end
