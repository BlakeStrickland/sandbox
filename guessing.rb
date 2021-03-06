def is_integer(guess)
  guess.to_i.to_s == guess || guess.to_f.to_s == guess
end

def numbernil(guess)
  guess.nil?
end

def play(guess, number)
  all_guesses = []
  count = 1
  while count <= 4
    if numbernil(guess)
      puts "Did you forget to type?"
      puts "Please enter another guess!"
      guess = gets.chomp
    elsif !is_integer(guess)
      puts "That is not a number!"
      puts "Please enter another guess!"
      guess = gets.chomp
    elsif guess.to_i == number
      puts "You got it! #{number} is right!"
      break
    elsif all_guesses.include?(guess)
      puts "Did you forget what you just did?"
      puts "Please enter another guess!"
      guess = gets.chomp
    elsif number < guess.to_i
      puts "Your guess is too high!"
      all_guesses << guess
      count += 1
      puts "You have #{(6-count)} guess(s) left"
      puts "Please enter another guess!"
      guess = gets.chomp
    elsif number > guess.to_i
      puts "Your guess is too low!"
      all_guesses << guess
      count += 1
      puts "You have #{(6-count)} guess(s) left"
      puts "Please enter another guess!"
      guess = gets.chomp
    end
  end
end

def wanted_number(number)
  puts "The number you were looking for was #{number}!"
end

def game_mode(gameplay)
  if gameplay == ""
    puts "Invalid game mode"
    puts "Restart applications and follow directions!"
  elsif gameplay[0].downcase == "e"
    puts "Easy mode!"
    puts "The number your looking for is between 1 and 10."
    puts "Please enter yor guess!"
    guess = gets.chomp
    number = [1,2,3,4,5,6,7,8,9,10].sample
    play(guess, number)
    wanted_number(number)
  elsif gameplay[0].downcase == "m"
    puts "Medium mode!"
    puts "The number your looking for is between 1 and 100."
    puts "Please enter yor guess!"
    guess = gets.chomp
    number = rand(1..100)
    play(guess, number)
    wanted_number(number)
  elsif gameplay[0].downcase == "h"
    puts "Hard mode!"
    puts "The number your looking for is between 1 and 1000."
    puts "Please enter yor guess!"
    guess = gets.chomp
    number = rand(1..1000)
    play(guess, number)
    wanted_number(number)
  else
    puts "Invalid game mode"
    puts "Restart applications and follow directions!"
  end
end




puts "Lets play a game, Guess my number!"
puts "Please enter which game mode you would like to play: Easy(E), Medium(M) or Hard (H)"
gameplay = gets.chomp
game_mode(gameplay)
