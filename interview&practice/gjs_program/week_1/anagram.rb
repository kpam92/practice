def anagram?(word1,word2)
    word1.chars.sort == word2.chars.sort
end

def print_anagrams(words)
result = Hash.new {|h,k| h[k] = [] }

words.each do |word|
    sorted = false
    result.keys.each do |key|
        if anagram?(key,word)
            result[key] << word
            sorted = true
        end
    end

    result[word] = word if sorted == false

end

result.values.each do |value|
    #[amor,roma,omar]
    puts value.join(' - ')
    # 'amor - roma - omar'
end

end
