class Day < ApplicationRecord 
  belongs_to :week 
  has_many :exercises, dependent: :destroy

  def self.create_days(week)
    counter = 1
    7.times do 
      Day.create(name: "Day #{counter}", week: week)
      counter += 1
    end 
  end 

end 