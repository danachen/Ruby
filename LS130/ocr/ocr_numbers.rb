class OCR
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def convert
    if input.size <= 12
      letter_definition.key(input) || "?"
    else
      input_formatted_per_row.map {|row|
                                 row.map {|number| letter_definition.key(number) || "?"}}
                                    .map {|row| row.join}.join(",")
    end
  end

  private
  def input_formatted_per_row
    each_row_in_string_form.map {|row|
                      row.split("\n")
                       .each_slice(3)
                       .map {|row| row.join("\n")}
                       .map {|row| row + ("\n")}}
  end

  def each_row_in_string_form
    input.split("\n\n")
         .map {|row| row.split("\n")}
         .map {|row| row.map {|el| el.scan(/.{1,3}/)}}
         .map {|group| group.transpose}
         .map {|row| row.join("\n")}
         .map {|row| row + ("\n")}
         .map {|row| row.gsub(/ +(?=\n)/, "")}
  end

  def letter_definition
    letter_zero = <<-NUMBER.chomp
 _
| |
|_|

     NUMBER

     letter_one = <<-NUMBER.chomp

  |
  |

     NUMBER

     letter_two = <<-NUMBER.chomp
 _
 _|
|_

     NUMBER

     letter_three = <<-NUMBER.chomp
 _
 _|
 _|

     NUMBER

     letter_four = <<-NUMBER.chomp

|_|
  |

     NUMBER

     letter_five = <<-NUMBER.chomp
 _
|_
 _|

     NUMBER

     letter_six = <<-NUMBER.chomp
 _
|_
|_|

     NUMBER

     letter_seven = <<-NUMBER.chomp
 _
  |
  |

     NUMBER

     letter_eight = <<-NUMBER.chomp
 _
|_|
|_|

     NUMBER

     letter_nine = <<-NUMBER.chomp
 _
|_|
 _|

     NUMBER

  @letter_dictionary = {"0" => letter_zero, "1" => letter_one, "2" => letter_two,
                          "3" => letter_three, "4" => letter_four, "5" => letter_five,
                          "6" => letter_six, "7" => letter_seven, "8" => letter_eight,
                          "9" => letter_nine}
  end
end