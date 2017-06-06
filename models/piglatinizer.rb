# require 'byebug'

class PigLatinizer
  # attr_accessor :text

  # def initialize(text)
  #   @text = text
  # end

  @@vowels = ['a', 'e', 'i', 'o', 'u']

  def piglatinize(string)

      if @@vowels.include?(string[0].downcase)
        first_vowels = string.match(/^[aeiouAEIOU]+/)[0]
        string += 'way'
      else
        first_consonants = string.downcase.match(/^[bcdfghjklmnpqrstvwxyz]+/)[0]
        count = first_consonants.size - 1
        letters = string.chars
        first_consonants = letters.slice!(0..count).join
        letters << first_consonants
        letters = letters.join
        letters += 'ay'
      end
  end

  def to_pig_latin(sentence)
    words = sentence.split(" ")

    words.map! do |word|
      piglatinize(word)
    end.join(" ")
  end

end
