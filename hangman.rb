class Hangman
  attr_reader :guessed_letters_list
  def initialize
    @guessed_letters_list = []
  end
  
  def random_word(array_words)
    array_words.sample
  end
  
  def guess(word)
    puts "Guess a letter: "
    letter = gets.chomp
    @guessed_letters_list << letter
    
    if word.include?(each_guessed_letter(@guessed_letters_list))
      puts "Nice guess."
      display_word(word, @guessed_letters_list)
    else
      puts "Guess again!"
    end
  end
  
  private
  
  def each_guessed_letter(array_guessed_letters)
    array_guessed_letters.each { |letter| return letter}
  end
  
  def display_word(word, letters)
    letters = @guessed_letters_list
    subbed = word.gsub(/[^#{letters}]/, ' _ ')
    puts subbed
  end
end

hangman = Hangman.new
word = hangman.random_word(['hello','love'])
loop do
  hangman.guess(word)
end