# Find Missing Numbers

def missing(arr)
  complete_arr = [*arr.min .. arr.max]
  new_arr = (complete_arr - arr).sort
end