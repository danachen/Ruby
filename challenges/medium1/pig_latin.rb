class PigLatin

  VOWELS_PIG_LATIN = %w[a e i o u yt xr]
  VOWELS = %[a e i o u]

  def self.translate(input)
    input.split.map {|word| transform(word)}.join(' ')
  end

  private

  def self.transform(word)
    if start_with_vowel?(word)
      word + add_end
    else
      word_without_consonant(word) + removed_consonant(word) + add_end
    end
  end

  def self.start_with_vowel?(word)
    VOWELS_PIG_LATIN.include?(word[0]) || VOWELS_PIG_LATIN.include?(word[0..1])
  end

  def self.add_end
    'ay'
  end

  def self.removed_consonant(word)
    consonant_sound = ''
    word.each_char.with_index.select do |k, idx|
      if k != 'u'
        consonant_sound += k if !VOWELS.include?(k)
        break if VOWELS.include?(k)
      else
        if VOWELS.include?(word[idx+1])
          consonant_sound += k
          break
        else
          break
        end
      end
    end
    consonant_sound
  end

  def self.word_without_consonant(word)
    word.gsub(removed_consonant(word), '')
  end
end

p PigLatin.translate('square')






