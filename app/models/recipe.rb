class Recipe < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :preparation_time, numericality: { greater_than_or_equal_to: 0 }
  validates :cooking_time, numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, presence: true

  def toggle_privacy!
    update(public: !public)
  end  
end
