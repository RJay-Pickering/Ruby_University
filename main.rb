require 'date'
dissapointment = 0
# true means that the user has work experience while false is the opposite!
work_experience = false
# true means that the user is worthy for an interview while false is the opposite!
worthy = true


puts "Welcome To Ruby University!"
puts "I am RubyBot, and I am here to assist you in your application process!"
puts ""
puts "What is your name?"

name = gets.chomp.to_s

puts ""
puts "Well #{name}, what is your date of birth? (EX: Year/Month/Day)"

birth_date = gets.chomp

d = DateTime.now
today = d.strftime("%Y%m%d")
birth = birth_date.tr('/','')
years = (today.to_i - birth.to_i) / 10000

if years < 17
    puts "Your not old enough #{name}, try again another time!"
else
    puts "So your #{years} years old..."
    puts ""
    puts "You are old enough! Tell me, what are your achevements?"

    achevements = gets.chomp
    while true
        if achevements == "" or achevements == " "
            dissapointment += 1
            puts "Please put at least 1 achevement!"
            achevements = gets.chomp
        else
            break
        end
    end

    puts "Hmmm... Okay, well we will evaluate this later, do you have any work experience?"

    while true
        work = gets.chomp.downcase
        if work == "yes"
            work_experience = true
            puts "Wonderful, could you please name them all?"
            jobs = gets.chomp
            break
        elsif work == "no"
            work_experience = false
            puts "To bad..."
            break
        else
            puts "Please try typing yes or no instead of #{work}!"
        end
    end

    puts "Your skills?"

    skills = gets.chomp
    while true
        if skills == "" or skills == " "
            dissapointment += 1
            puts "Please put at least 1 skill!"
            skills = gets.chomp
        else
            break
        end
    end

    puts "One last question..."
    puts "What obstacles that you have overcome!"

    obstacles = gets.chomp
    while true
        if obstacles == "" or obstacles == " "
            dissapointment += 1
            worthy = false
            puts "Oh..."
            break
        else
            puts "Wonderful!"
            break
        end
    end

    if dissapointment >= 3
        worthy = false
    end

    next_month = d.next_month.strftime("%d/%m/%Y")

    while true
        if worthy == false
            puts "You have been declined an interview with the board... please try again next year!"
            break
        elsif dissapointment == 0
            puts "You passed! You will have an interview on #{next_month}, good luck!   =)"
        else
            puts "You barely passed! You will have an interview on #{next_month}, good luck!   =)"
        end
    end
end