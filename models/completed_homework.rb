class CompletedHomework < ActiveRecord::Base
  belongs_to :account
  belongs_to :homework
end
