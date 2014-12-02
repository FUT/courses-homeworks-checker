class Homework < ActiveRecord::Base
  has_many :completed_homeworks
  has_many :accounts, through: :completed_homeworks
end
