class Hangman
  
  def random_word(array_words)
    array_words.sample
  end
  
  
end

hangman = Hangman.new
puts word = hangman.random_word(['hello','love'])