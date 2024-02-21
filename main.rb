require 'date'

class Acceptance
    attr_accessor :disappointment, :work_experience, :worthy
end

def main
    acceptance = Acceptance.new()
    acceptance.disappointment = 0
    # true means that the user has work experience while false is the opposite!
    acceptance.work_experience = false
    # true means that the user is worthy for an interview while false is the opposite!
    acceptance.worthy = true

    d = DateTime.now
    today = d.strftime("%Y%m%d")
    achev = Array.new
    exp = Array.new
    skil = Array.new
    obst = Array.new

    puts "Welcome To Ruby University!"
    puts "I am RubyBot, and I am here to assist you in your application process!"
    puts ""
    puts "What is your name?"

    name = gets.chomp.to_s

    puts ""

    # //////////////////////////////getting the birth year//////////////////////////////
    puts "Well #{name}, what is your date of birth? (EX: Year/Month/Day)"

    birth_date = gets.chomp
    birth = birth_date.tr('/','')
    years = (today.to_i - birth.to_i) / 10000

    # /////////////////////////////////clearing terminal////////////////////////////////
    system("clear") || system("cls")
    # /////////////////////////////end of clearing terminal/////////////////////////////

    if years < 18
        puts "Your not old enough #{name}, try again another time when your 18 or older!"
    else
        puts "So your #{years} years old..."
    # ///////////////////////////end of getting the birth year///////////////////////////
        puts ""
        puts "You are old enough!"
        puts "Tell me, what are your achievements? press [q] to stop listing achievements."
    # ////////////////////////////////////achevements////////////////////////////////////
        while true
            achevements = gets.chomp
            if achevements == "q"
                if achev.length == 0
                    acceptance.disappointment += 1
                    puts "Oh..."
                    break
                else
                    break
                end
            elsif achevements.tr(' ', '').length != 0
                achev.push(achevements)
            end
        end
    # /////////////////////////////////end of achevements/////////////////////////////////

        # /////////////////////////////////clearing terminal////////////////////////////////
        system("clear") || system("cls")
        # /////////////////////////////end of clearing terminal/////////////////////////////

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
                        if exp.length == 0
                            acceptance.disappointment += 1
                            break
                        else
                            break
                        end
                    elsif jobs.tr(' ', '').length != 0
                        exp.push(jobs)
                    end
                end
                break
            elsif work == "no"
                acceptance.work_experience = false
                break
            else
                acceptance.disappointment += 1
                puts "Please try typing yes or no instead of #{work}!"
            end
        end
    # ///////////////////////////////end of work experience///////////////////////////////

        # /////////////////////////////////clearing terminal////////////////////////////////
        system("clear") || system("cls")
        # /////////////////////////////end of clearing terminal/////////////////////////////

        if acceptance.work_experience == false
            puts "To bad..."
        end
        puts "What are your skills? press [q] to stop listing skills"

    # ///////////////////////////////////////skills///////////////////////////////////////
        while true
            skills = gets.chomp
            if skills == "" and skil.length == 0 or skills == " " and skil.length == 0
                acceptance.disappointment += 1
                puts "Please put at least 1 skill!"
                skills = gets.chomp
            elsif skills == "q"
                break
            elsif skills != "" or skills != " "
                skil.push(skills)
            end
        end
    # ///////////////////////////////////end of skills///////////////////////////////////

        # /////////////////////////////////clearing terminal////////////////////////////////
        system("clear") || system("cls")
        # /////////////////////////////end of clearing terminal/////////////////////////////

        puts "One last question..."
        puts "What obstacles have you overcome? press [q] to stop listing obstacles"

    # /////////////////////////////////////obstacles/////////////////////////////////////
        while true
            obstacles = gets.chomp
            if obstacles == "" or obstacles == " " or obstacles == "none" or obstacles == "None"
                puts "Please put a valid obstacle!"
            elsif obstacles == "q"
                if obst.length == 0
                    acceptance.disappointment += 1
                    acceptance.worthy = false
                    puts "Oh..."
                    break
                else
                    puts "Wonderful!"
                    break
                end
            else
                obst.push(obstacles)
            end
        end
    # //////////////////////////////////end of obstacles//////////////////////////////////

        if acceptance.disappointment >= 2
            acceptance.worthy = false
        end

        next_month = d.next_month.strftime("%m/%d/%Y")

        # /////////////////////////////////clearing terminal////////////////////////////////
        system("clear") || system("cls")
        # /////////////////////////////end of clearing terminal/////////////////////////////

    # //////////////////////////////////accepted or not//////////////////////////////////
        score = Random.new
        if acceptance.worthy == false
            puts "You have been declined an interview with the board... please try again next year!"
            results = score.rand(0..59) 
            puts "Your total score is #{results}!"
        elsif acceptance.disappointment == 0
            puts "You passed! You will have an interview on #{next_month}, good luck!   =)"
            results = score.rand(80..100) 
            puts "Your total score is #{results}!"
        else
            puts "You barely passed! You will have an interview on #{next_month}, good luck!   =)"
            results = score.rand(60..79)
            puts "Your total score is #{results}!"
        end
    # ///////////////////////////////end of accepted or not///////////////////////////////
        if achev.length != 0
           puts "Heres a list of your achievements: #{achev}"
        end
        if acceptance.work_experience == true and exp.length != 0
            puts "Heres a list of your experience: #{exp}"
        end
        if skil.length != 0
          puts "Heres a list of your skills: #{skil}"
        end
        if obst.length != 0
          puts "Heres a list of your obstacles: #{obst}"
        end
        
        
    end
end

main