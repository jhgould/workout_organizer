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

  def self.update_day(days, update_params)
    counter = 1
    days.each do |day|
      update = "day_#{counter}"
      day.name = update_params[update.to_sym]
      day.save!
      counter += 1
    end 
  end 

end 