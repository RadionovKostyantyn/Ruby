def main()
    puts "Enter two digits and one ceration [+, -, *, /] with a enter"
    a  = gets.chomp
    b  = gets.chomp
    c  = gets.chomp
    
    if !((a || b) =~ /[[:digit:]]/)
        puts "incorrect digits"
        exit(1)
    end

    a = a.to_i
    b = b.to_i
    if c == '+'
        puts "#{a + b}"
    elsif c == '-'
        puts "#{a - b}"
    elsif c == '/'
        begin
            puts "#{a / b}"
        rescue ZeroDivisionError => e
            puts e.message
        end
    elsif c == '*'
        puts "#{a * b}"
    else
        puts "incorrect operation"
        exit(1)
    end
end

main()