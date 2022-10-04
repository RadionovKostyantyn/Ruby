def main()
	puts "[СМС] Введите 1, 2 или 3 чтобы выбрить камень, ножницы и бумагу соответственно [СМС]"
	puts "[1 - ножницы, 2 - камень, 3 - бумага]"
	input_b = rand(1..3)			# computer
	input_a = gets.to_i			# user

	res = input_a - input_b
	if res == 1 || res == -2
		puts "Победа пользователя: компьютер выбрал " + fun_interpreter_to_texty(input_b)
	elsif  res == -1 || res == 2 
		puts "Проигрыш пользователя: компьютер выбрал " + fun_interpreter_to_texty(input_b)
	else
		puts "Ничья: компьютер выбрал " + fun_interpreter_to_texty(input_b)
	end
end

def fun_interpreter_to_texty(a)

	if a == 1
		return "ножницы"
	elsif a == 2
		return "камень"
	elsif a == 3
		return "бумагу"
	else
		return ""
	end
end

main()