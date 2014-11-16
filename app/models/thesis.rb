class Thesis < ActiveRecord::Base
  belongs_to :user
  has_many :participants, class_name: "User", foreign_key: :chosen_thesis_id
end
