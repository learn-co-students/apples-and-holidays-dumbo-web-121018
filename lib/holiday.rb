require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  # binding.pry
  holiday_hash[:winter].map do |key, value|
    value << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply  
end

# merge use for hashes from ruby-doc 
# h1 = { "a" => 100, "b" => 200 }
# h2 = { "b" => 254, "c" => 300 }
# h1.merge(h2)   #=> {"a"=>100, "b"=>254, "c"=>300}
# h1.merge(h2){|key, oldval, newval| newval - oldval}
#               #=> {"a"=>100, "b"=>54,  "c"=>300}
# h1             #=> {"a"=>100, "b"=>200}

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  new_holiday = {holiday_name => supply_array}
  holiday_hash[season][holiday_name] = supply_array
  # binding.pry
  # holiday_hash[season].merge(new_holiday)
  # binding.pry
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies = []
  holiday_hash[:winter].map do |holidays, supply_arrays|
    # binding.pry
    supply_arrays.map do |supplies|
      winter_supplies << supplies
    end
  end
  winter_supplies
  # binding.pry
end

# Justin's suggestion to correctly display New Years 
# "or better yet, split it into an array at the _, and then capitalize both words"

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.map do |seasons, holidays|
    string_seasons = seasons.to_s.capitalize
    # binding.pry
    puts "#{string_seasons}:"
    holidays.map do |holiday, supply_arrays|
      array_holidays = holiday.to_s.split("_")
      string_holidays = array_holidays.map do |holidays|
        # binding.pry
        string_holidays = holidays.capitalize
      end
      puts "  #{string_holidays.join(" ")}: #{supply_arrays.join(", ")}"
    end
  end
end

# has_value syntax for reference
# h = { "a" => 100, "b" => 200 }
# h.has_value?(100)   #=> true
# h.has_value?(999)   #=> false

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_array = []
  holiday_hash.map do |seasons, holidays|
    # binding.pry
    holidays.map do |holiday, supplies|
      # binding.pry
      if supplies.include?("BBQ") 
        bbq_array << holiday
      end
    end
  end
  # binding.pry
  bbq_array
end







