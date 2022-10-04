def main()
    words = [
        ["стол", "тумбочка", "кровать", "кресло", "табуретка", "стул"],
        ["шакал", "конь", "рысь", "волк", "ворон", "голубь", "надюка", "дрозд"],
        ["адонис", "адиантум", "азалия", "аллисум", "анемона", "арабис", "астильбоидес"]]                                  
    selected_word = ""    

    loop do
        print "Select category [1 - Furniture, 2 - Animal, 3 - Plant, 4 - Random]\n<< "
        category = gets.to_i
        
        case category
        when 1
            selected_word = words[0][rand(words[0].size)]
            break
        when 2
            selected_word = words[1][rand(words[1].size)]
            break
        when 3
            selected_word = words[2][rand(words[2].size)]
            break
        when 4
            i = rand(words.size)
            j = rand(words[i].size)
            selected_word = words[i][j]
            break
        else
          "Error: invalid value!"
        end
    end
   
    must_guess = selected_word.length                
    have_attemps = 7    

    mistakes = Array.new()
    already_guess = Array.new()
    curet_progress = Array.new(selected_word.length, "_")


    puts "\n======================== GAME START ========================"
    while have_attemps != 0 && must_guess != 0 do
        puts "\nWord: #{curet_progress.join(".")}"
        puts "Attemps: #{have_attemps}"
        puts "Mistakes: #{mistakes.join(",")}"

        print "Enter symbol << "
        inpt = gets.chomp.downcase
        if already_guess.include?(inpt)
            puts ">> You have already guessed this symbol"
            next  
        end

        number_matche = selected_word.count(inpt)
        if number_matche == 0
            puts ">> You didn't guess"
            have_attemps -= 1
            mistakes << inpt
        else
            puts ">> You guessed it"
            must_guess -= number_matche
           do_something_interesting(curet_progress, selected_word, inpt, number_matche)
            already_guess << inpt
        end
    end

    puts "\n======================== GAME OVER ========================"
    puts "The guessing word is #{selected_word}"
    if  must_guess == 0 
        puts "YOU WIN"
    else
        puts "YOU LOSE" 
    end

end

def do_something_interesting(curet_progress, selected_word, inpt, number_matche)
    d = 0
    replace = 0
    while replace < number_matche do
        if selected_word[d] == inpt
            curet_progress[d] = inpt
            replace += 1
        end
        d += 1
    end
end

main()