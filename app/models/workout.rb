class Workout < ApplicationRecord
    has_many :weeks, dependent: :destroy
end 