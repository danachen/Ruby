class Isogram
  def self.isogram?(str)
    letters = str.downcase.scan(/\w/)
    letters.uniq == letters
  end
end