# frozen_string_literal: true

class CodeReminder < ApplicationRecord
  enum cadence_unit: { weeks: 0, days: 1, months: 2 }
  validates :email, uniqueness: true, presence: true
  validates :cadence, presence: true
  validates :cadence_unit, presence: true
end
