class Hangman
  attr_reader :guessed_letters_list
  def initialize
    @guessed_letters_list = []
  end
  
  def random_word(array_words)
    array_words.sample
  end
  
  def display_word(word, letters)
    letters = @guessed_letters_list
    subbed = word.gsub(/[^#{letters}]/, ' _ ')
    puts subbed
  end
end

hangman = Hangman.new
word = hangman.random_word(['hello','love'])