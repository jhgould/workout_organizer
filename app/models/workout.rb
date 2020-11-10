class Workout < ApplicationRecord
    has_many :weeks, dependent: :destroy

    belongs_to :user
end 