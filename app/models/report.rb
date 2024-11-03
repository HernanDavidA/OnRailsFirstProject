class Report < ApplicationRecord
  enum status: { new_report: 0, pending: 1, in_progress: 2, done: 3 }
  belongs_to :coffee_station
end
