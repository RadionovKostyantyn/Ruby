OPERATOR_PRIORITY = {
    "(" => 0,
    "+" => 1,
    "-" => 1,
    "*" => 2,
    "/" => 2,
    "^" => 3, 
}

def calculated_function(operator, number1, number2)
    res = 0

    if operator == "+"
        res = number1 + number2
    elsif operator == "-"
        res = number1 - number2
    elsif operator == "*"
        res = number1 * number2
    elsif operator == "/"
        begin
            res = number1 / number2
        rescue ZeroDivisionError => error
            puts error.message
            exit(1)
        end
    elsif operator == "^"
        res = number1.pow(number2)
    end
    
    res
end

def calculate_polish_line(polishLine)
    stackcResult = Array.new

    iter = 0
    while iter < polishLine.length do 
        ch = ""

        if polishLine[iter] == " "
            #puts "#{iter} - I am blank |#{polishLine[iter]}|"
            iter += 1
            next
        end


        #puts "-- read number start"
        while polishLine[iter] != " " && iter < polishLine.length do 
            #puts "(#{iter}) - #{polishLine[iter]}"
            ch << polishLine[iter]
            iter += 1
        end
        #puts "-- read number end"

        if ch =~ /[[:digit:]]/
            stackcResult.push(ch)
        else
            b = stackcResult.pop.to_i
            a = stackcResult.pop.to_i
            stackcResult.push(calculated_function(ch, a, b))
        end

        #print "Stat #{ stackcResult}\n"
    end

    stackcResult.pop
end

def read_number(position, string)
    operator = ""
    while string[position] =~ /[[:digit:]]/ do 
        operator << string[position]
        position += 1
    end
    operator
end

def parse_in_polish_line(simpleLine)
    polishLine = ""
    stackcOperation = Array.new

    iter = 0
    while iter < simpleLine.length do 
        ch = ""

        if "0123456789".include?(simpleLine[iter])
            ch = read_number(iter, simpleLine)
        else
            ch = simpleLine[iter]
        end
        iter += ch.length()

        if ch == " " 
            if polishLine[polishLine.length-1] != " "
                polishLine << ch
            end
            next
        end

        if ch =~ /[[:digit:]]/
            polishLine << ch

        elsif ch == "("
            stackcOperation.push(ch)

        elsif ch == ")"
            while stackcOperation.last != "(" do
                if polishLine[polishLine.length-1] != " "
                    polishLine << " "
                end
                polishLine << stackcOperation.pop() 
            end
            stackcOperation.pop()

        else
            if stackcOperation.empty?
                stackcOperation.push(ch)
            elsif OPERATOR_PRIORITY[stackcOperation.last] < OPERATOR_PRIORITY[ch]
                stackcOperation.push(ch)
            else
                while !stackcOperation.empty? && 
                    OPERATOR_PRIORITY[stackcOperation.last] >= OPERATOR_PRIORITY[ch] do
                    if polishLine[polishLine.length-1] != " "
                        polishLine << " "
                    end
                    polishLine << stackcOperation.pop()
                end
                
                stackcOperation.push(ch)
            end
        end
    end
 
    while !stackcOperation.empty?
        if polishLine[polishLine.length-1] != " "
            polishLine << " "
        end
        polishLine << stackcOperation.pop()
    end

    polishLine
end



def main
    string = "2 + 3"
    polishLine = parse_in_polish_line(string)

    puts polishLine
    puts "Resutl: #{calculate_polish_line(polishLine)}"
end

main()