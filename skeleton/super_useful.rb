# PHASE 2
require 'byebug'
def convert_to_int(str)
  Integer(str)
rescue ArgumentError => e 
  nil

end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    begin
      raise NotAFruit, "Give coffee" 
    rescue NotAFruit => e 
      puts e 
      puts "Give me coffee or give me death" 
      coffee = gets.chomp.downcase
      if coffee == "coffee"
        feed_me_a_fruit
      else
        begin
          raise NotCaffeine, "What's wrong with you?"
        rescue NotCaffeine => e
          puts e
        end
      end
    end
  end
end 

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
end  

class NotAFruit < RuntimeError
end 

class NotCaffeine < RuntimeError
end 

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    
    begin
      
      raise DoUEvenKnoMe, "You know nothing about me!" if (@name || @fav_pastime) == "" 
      raise NotFriend, "We're not REALLY friends" if @yrs_known < 5
    end
    

     
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end

class NotFriend < RuntimeError
end

class DoUEvenKnoMe < RuntimeError
end