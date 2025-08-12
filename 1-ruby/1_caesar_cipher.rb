def caesar_cipher(plaintext, shift)
  shift = shift % 26
  plaintext.chars.map do |char|
    if char =~ /[a-z]/
      (((char.ord - 'a'.ord + shift) % 26) + 'a'.ord).chr
    elsif char =~ /[A-Z]/
      (((char.ord - 'A'.ord + shift) % 26) + 'A'.ord).chr
    else
      char
    end
  end.join
end

puts caesar_cipher("What a string!", 5)