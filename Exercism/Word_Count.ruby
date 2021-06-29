class Phrase
  attr_reader :str

  def initialize(str)
    @str = str
  end

  def word_count
    str.scan(/\w+?\'\w|\w+/).each_with_object(Hash.new(0)) { |item, hash| hash[item.downcase] +=1 }
  end
end