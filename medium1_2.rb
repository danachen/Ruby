# Text Analyzer - Sandwich Code
# require 'medium1_2.txt'

class TextAnalyzer
  def process
    file = File.open("medium1_2.txt", "r")
    yield(file.read)
    file.close
  end
end

# solution calling an explicit block

class TextAnalyzer
  def process(&block)
    File.open('medium1_2.txt', &block)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.read.split(/\n\n/).count} paragraphs" }
