require 'date'

class Acceptance
    attr_accessor :dissapointment, :work_experience, :worthy
end

def main
    acceptance = Acceptance.new()
    acceptance.dissapointment = 0
    # true means that the user has work experience while false is the opposite!
    acceptance.work_experience = false
    # true means that the user is worthy for an interview while false is the opposite!
    acceptance.worthy = true

    puts "Welcome To Ruby University!"
    puts "I am RubyBot, and I am here to assist you in your application process!"
    puts ""
    puts "What is your name?"

    name = gets.chomp.to_s

    puts ""

    # //////////////////////////////getting the birth year//////////////////////////////
    puts "Well #{name}, what is your date of birth? (EX: Year/Month/Day)"

    birth_date = gets.chomp

    d = DateTime.now
    today = d.strftime("%Y%m%d")
    birth = birth_date.tr('/','')
    years = (today.to_i - birth.to_i) / 10000
    achev = Array.new
    exp = Array.new
    skil = Array.new
    obst = Array.new

    if years < 17
        puts "Your not old enough #{name}, try again another time!"
    else
        puts "So your #{years} years old..."
    # ///////////////////////////end of getting the birth year///////////////////////////
        puts ""
    # ////////////////////////////////////achevements////////////////////////////////////
        while true
            puts "You are old enough! Tell me, what are your achevements? press [q] to stop listing achevements."
            achevements = gets.chomp
            if achevements == "q"
                if achev.length == 0
                    acceptance.dissapointment += 1
                    puts "Please put at least 1 achevement!"
                    achevements = gets.chomp
                else
                    break
                end
            end
            while true
                if achevements == "" or achevements == " "
                    acceptance.dissapointment += 1
                    puts "Please put at least 1 achevement!"
                    achevements = gets.chomp
                else
                    achev.push(achevements)
                    break
                end
            end
        end
    # /////////////////////////////////end of achevements/////////////////////////////////
        puts "Hmmm... Okay, well we will evaluate this later, do you have any work experience?"

    # //////////////////////////////////work experience//////////////////////////////////
        while true
            work = gets.chomp.downcase
            if work == "yes"
                acceptance.work_experience = true
                puts "Wonderful, could you please name them all? press [q] to leave"
                while true
                    jobs = gets.chomp
                    if jobs == "q"
                        break
                    end
                    exp.push(jobs)
                end
                break
            elsif work == "no"
                acceptance.work_experience = false
                puts "To bad..."
                break
            else
                puts "Please try typing yes or no instead of #{work}!"
            end
        end
    # ///////////////////////////////end of work experience///////////////////////////////

        puts "Your skills? press [q] to stop listing skills"

    # ///////////////////////////////////////skills///////////////////////////////////////
        skills = gets.chomp
        while true
            if skills == "" or skills == " "
                acceptance.dissapointment += 1
                puts "Please put at least 1 skill!"
                skills = gets.chomp
            elsif skills == "q"
                break
            else
                skil.push(skills)
            end
        end
    # ///////////////////////////////////end of skills///////////////////////////////////

        puts "One last question..."
        puts "What obstacles that you have overcome!"

    # /////////////////////////////////////obstacles/////////////////////////////////////
        obstacles = gets.chomp
        while true
            if obstacles == "" or obstacles == " "
                puts "Please put a valid obstacle!"
            elsif (obstacles == "none" and obst.length == 0) or (obstacles == "Have none" and obst.length == 0) 
                acceptance.dissapointment += 1
                acceptance.worthy = false
                puts "Oh..."
                break
            elsif obstacles == "q"
                puts "Wonderful!"
                break
            else
                obst.push(obstacles)
            end
        end
    # //////////////////////////////////end of obstacles//////////////////////////////////

        if acceptance.dissapointment >= 3
            acceptance.worthy = false
        end

        next_month = d.next_month.strftime("%d/%m/%Y")

    # //////////////////////////////////accepted or not//////////////////////////////////
        score = Random.new
        while true
            if acceptance.worthy == false
                puts "You have been declined an interview with the board... please try again next year!"
                results = score.rand(0..59) 
                puts "Your total score is #{results}!"
                break
            elsif acceptance.dissapointment == 0
                puts "You passed! You will have an interview on #{next_month}, good luck!   =)"
                results = score.rand(80..100) 
                puts "Your total score is #{results}!"
                break
            else
                puts "You barely passed! You will have an interview on #{next_month}, good luck!   =)"
                results = score.rand(60..79)
                puts "Your total score is #{results}!"
                break
            end
        end
    # ///////////////////////////////end of accepted or not///////////////////////////////

    puts "Heres a list of your achevements: #{achev}"
    puts "Heres a list of your experience: #{exp}"
    puts "Heres a list of your skills: #{skil}"
    puts "Heres a list of your obstacles: #{obst}"
    end
end

main