arr=[1,2,3,4,5,6,7,8,9,10]

arr_new=arr.select {|k| puts k if k%2!=0}

arr_new