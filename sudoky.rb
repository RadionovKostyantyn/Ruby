def conditions (matrix, row, column, max_r, max_c, num)

    i = 0
    while i < max_c do
        if matrix[row][i] == num
            return false
        end
        i += 1
    end

    i = 0
    while i < max_r do
        if matrix[i][column] == num
            return false
        end
        i += 1
    end

    str = row - row % 3
    stc = column - column % 3
    i = 0
    j = 0
    while i < 3 do
        while j < 3 do
            if (matrix[i + str][j + stc] == num)
                return false
            end
            j += 1
        end
        i += 1
    end

    true
end

def GetResultSudoky(matrix, row, column, max_r, max_c)
    if (row == max_r-1 && column == max_c)
        return true
    end

    if column == max_c 
        column = 0
        row += 1
    end

    if (matrix[row][column] != 0)
        return GetResultSudoky(matrix, row, column + 1, max_r, max_c)
    end

    for digit in 1..9 do
        if (conditions(matrix, row, column, max_r, max_c, digit))
            matrix[row][column] = digit

            if (GetResultSudoky(matrix, row, column + 1, max_r, max_c))
                return true
            end
        end

        matrix[row][column] = 0
    end
    

    false
end

def OutputInStdout(matrix, r, c)
    i = 0
    while i < r do
        j = 0
        while j < c do
            print "#{matrix[i][j]} "
            j += 1
        end
        i += 1
        puts 
    end
end

def main()
    grid = [[ 3, 0, 6, 5, 0, 8, 4, 0, 0 ],
                         [ 5, 2, 0, 0, 0, 0, 0, 0, 0 ],
                         [ 0, 8, 7, 0, 0, 0, 0, 3, 1 ],
                         [ 0, 0, 3, 0, 1, 0, 0, 8, 0 ],
                         [ 9, 0, 0, 8, 6, 3, 0, 0, 5 ],
                         [ 0, 5, 0, 0, 9, 0, 6, 0, 0 ],
                         [ 1, 3, 0, 0, 0, 0, 2, 5, 0 ],
                         [ 0, 0, 0, 0, 0, 0, 0, 7, 4 ],
                         [ 0, 0, 5, 2, 0, 6, 3, 0, 0 ] ]

    GetResultSudoky(grid, 0, 0, 9, 9)
    OutputInStdout(grid, 9, 9)
end

main()

