class Cookie
   
   attr_accessor :name, :health, :defense, :weapons, :lowDefense, :winCount
   attr_writer :intelligence
   
  def initialize(name, intelligence)
       puts "please enter your name."
       @name = gets.chomp
       @intelligence = intelligence
       @health = 100
       @lowDefense = 0
       @defense = Random.new.rand(@lowDefense..100)
       @weapons = []
       @winCount = 0
  end
  def changeDefense()
      @defense = Random.new.rand(0..100)
  end

class Foe
   
  attr_accessor :name, :offense, :skill, :health
   
  def initialize(name, skill)  
       @name = name
       @offense = Random.new.rand(0..100)
       @skill = skill
       @health = 100
  end
   
  def attack(cookie)
      cookie.changeDefense()
      @offense = Random.new.rand(0..100)

      puts "#{cookie.name}'s health is #{cookie.health}"
      puts "The foe's health is #{@health}"
      puts "Your win streak is: #{cookie.winCount}, reach 3 to level up!"
       puts "Do you want to fight?"
       response = gets.chomp
       if response == "yes"
           if @offense > cookie.defense
               cookie.health -= 10
               puts "The foe has defeated you!"
               cookie.winCount = 0
           else
               puts "You win!  The foe has lost health!"
               @health -= 10
               cookie.winCount += 1
               number = Random.new.rand(0..100)
                    if number.between?(15, 50)
                        puts "The enemy has dropped a health item!"
                        cookie.health += 5
                    elsif number.between?(60, 95)
                        puts "The enemy has dropped a fighting upgrade!  You have a hightened chance of winning!"
                        cookie.lowDefense += 10
                    else
                    
                    end
                    if cookie.winCount >= 3
                        cookie.winCount = 0
                       puts "You have leveled up!  Choose and type 'health bonus' or 'fighting upgrade'"
                       user_upgrade = gets.chomp
                            if user_upgrade == "health bonus"
                                cookie.health += 10
                                puts "added 10 health!"
                            elsif user_upgrade == "fighting upgrade"
                                cookie.lowDefense += 15
                                "fighting upgrade added!"
                            else
                                
                            end
                    end
           end
       elsif response == "no"
           numb = Random.new.rand(1..12)
           if numb.between?(1,4)
              puts "You've avoided the fight!  Nothing happens.  Pointless move."
           elsif numb.between?(5,8)
              puts "Your enemy is sad you don't want to fight them.  You are the bully now."
           else numb.between?(9,12)
              puts "Your enemy will wait for you to say yes because they are respectfull of your decisions"
           end
       else
           num = Random.new.rand(1..20)
            if num.between?(1,5)
               puts "Please enter yes or no, I am not an advanced system"
            elsif num.between?(11,15)
               puts "Entering things other yes or no makes me uncomfy.  Please don't make me uncomfy."
            elsif num.between?(16,20)
               puts "Type yes or no please.  I feel as though you are mocking me. I will therefore inflict damage because of your rudeness."
               cookie.health -= 5
            else num.between?(6,10)
               puts "Enter yes or no, I have no time for games.  Other than the game we are playing."
            end
           attack(cookie)
       end
  end
end



frank = Foe.new("Frank", "Eating cookies with razor sharp teeth")
cassandra = Cookie.new("Cassandra", "smart")



while cassandra.health > 0 and frank.health > 0
    frank.attack(cassandra)
    
end
end
