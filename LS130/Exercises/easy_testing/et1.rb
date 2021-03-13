# Boolean Assertions

# Write a minitest assertion that will fail if the value.odd? is not true.

def value_odd_not_true
  assert value.odd?, 'value is not odd'
end

# assert_equal true, value.odd?