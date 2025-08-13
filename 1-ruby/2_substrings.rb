def substrings(text, dictionary)
  result = Hash.new
  dictionary.each do |word|
    if !result.include?(word.downcase)
      result[word.downcase] = text.downcase.scan(word.downcase).size
    else
      result[word.downcase] += 1
    end
  end
  result.each do |key, value|
    if value == 0
      result.delete(key)
    end
  end
  result
end
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?",dictionary)