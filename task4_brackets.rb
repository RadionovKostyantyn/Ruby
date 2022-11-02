def main()
  string = ""
  stop = false

  puts "Введите '^exit' чтобы закончить ввод"
  while !stop do 
    print "Введите некст скобочку: "
    ch = gets.chomp
    if ch.include?("^exit")
      break
    end
    string << ch[0]
  end

  print string
  puts "==> #{solve_problem(string)}"

end

def solve_problem(string)
    open_s = {"(" => 001, "{" => 002, "[" => 003}
    close_s = {")" => 001, "}" => 002, "]" => 003}
    stack  = [] 

    string.each_char do |ch|
      if open_s.include?(ch)
        stack.push(ch)
      else
        open_s[stack.last] == close_s[ch] ? stack.pop : (return false)
      end
    end
    return (stack.empty?)
end

main()