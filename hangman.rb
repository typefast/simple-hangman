class Hangman
  attr_reader :guessed_letters_list
  def initialize
    @guessed_letters_list = []
  end
  
  def random_word(array_words)
    array_words.sample
  end
  
  def user_input
    puts "Guess a letter: "
    letter = gets.chomp
    letter
  end
  
  def guess(word)
    letter = user_input
    if letter.length > 1
      puts "One leter at a time..."
      letter = user_input
    end
    letter_check(word, letter)
  end
  
  def letter_check(word, letter)
    if word.include?(letter)
      @guessed_letters_list << letter
      puts "Good guess"
      word_check(word)
      won?(word, @guessed_letters_list)
    else
      puts "Nope, Try again!"
    end
  end
  
  def word_check(word)
    word.include?(each_guessed_letter(@guessed_letters_list))
    display_word(word, @guessed_letters_list)
  end
  
  def display_word_length(word)
    blank_word = word.gsub(/[a-z]/, ' _ ')
    length = word.length
    puts "The word is #{length} letters in length."
    puts "#{blank_word}"
  end
  
  private
  
  def won?(word, letter_list)
    split_word = word.split('')
    if split_word.all? { |letters| letter_list.include?(letters)}
      puts "Winner"
      exit(0)
    end
  end
  
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
hangman.display_word_length(word)
loop do
  hangman.guess(word)
end