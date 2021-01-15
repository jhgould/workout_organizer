class Week < ApplicationRecord
    belongs_to :workout
    has_many :days, dependent: :destroy

    def self.create_number_of_weeks(num, workout)
        counter = 1
        num.to_i.times do 
            Week.create(name: "Week #{counter}", workout: workout )
            counter += 1
        end 
    end

    def self.create_days_for_week(weeks)
        weeks.each do |week|
           counter = 1
            7.times do 
                Day.create(name: "Day #{counter}", week: week)
                counter += 1
            end  
        end 
    end 
end 