class Week < ApplicationRecord
    belongs_to :workout

    def self.number_of_weeks(num, workout)
        counter = 1
        num.to_i.times do 
            Week.create(name: "Week #{counter}", workout: workout )
            counter += 1
        end 
    end


end 