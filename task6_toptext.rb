def main
    string = "e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e"
    print xxx(string.downcase.split(/[^[[:word:]'-]]/))
end

def xxx(str)
    hash = Hash.new
    iterator = 0
    for w in str do
        if w.length == 0 || hash.include?(w)
            next
        else
            hash[w] = str.count(w)
        end
    end
    r = hash.sort_by {|k, v| v}.to_h.keys.reverse
    r[0..2]
end

main()