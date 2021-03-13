require 'minitest/autorun'
require_relative 'odd_words'

class OddWordsTest < Minitest::Test

  def test_example
    # skip
    expected = 'whats eht matter htiw kansas.'
    assert_equal expected, OddWords.transform('whats the matter with kansas.')
  end

  def test_random
    # skip
    expected = 'gooooood gninrom sunshine.'
    assert_equal expected, OddWords.transform('gooooood morning sunshine.')
  end

  def test_nil_value
    expected = ''
    assert_equal expected, OddWords.transform('')
  end

  def test_period
    expected = '.'
    assert_equal expected, OddWords.transform('.')
  end

  def test_hello
    expected = 'hello'
    assert_equal expected, OddWords.transform('hello')
  end

  def test_hello_word
    expected = 'hello drow.'
    assert_equal expected, OddWords.transform('hello word.')
  end

  def test_hello_word_spaces
    expected = 'hello drow.'
    assert_equal expected, OddWords.transform('hello word .')
  end

  def test_hello_word_more_spaces
    expected = 'hello drow.'
    assert_equal expected, OddWords.transform('hello   word   .')
  end

  def test_hello_word_even_more_spaces
    expected = 'hello drow.'
    assert_equal expected, OddWords.transform('hello word  .')
  end

  def test_three_words
    expected = 'hello drow world.'
    assert_equal expected, OddWords.transform('hello word world .')
  end

end