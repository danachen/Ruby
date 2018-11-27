# Encrypted Pioneers

# Problem: Each of the letters in the string is encrypted, each letter is pushed forward
# in the alphabet by 13 spaces
# Input: string of letters
# Output: string of letters
# Process: how the encryption works: from A-M, and a - m, the ASCII is + 13
# from N - Z, and n-z, the ASCII is -13
# Algo: go through each letter, the ones that are part of the first group, apply +13
# the ones that are second part of the alphabet, apply -13
# problem with converting the decyphered text into readable names with spaces

# def rot13(name)
#   alpha_case = ("a".."z").to_a + ("a".."z").to_a + ("A".."Z").to_a + ("A".."Z").to_a
#   name.split("").map do |letter| 
#     alpha_case.include?(letter) ? alpha_case[(alpha_case.find_index(letter) + 13)] : letter
#   end.join
# end

# NAMES.each do |name|
#   puts rot13(name)
# end

NAMES = ['Nqn Ybirynpr',
              'Tenpr Ubccre',
              'Nqryr Tbyqfgvar',
              'Nyna Ghevat']

def decrypt(name)
  new_arr = []
  name.split.map do |letter|
    # puts letter
    if [*('a'..'m'), *('A'..'M')].include?(letter)
      new_arr << (letter.ord + 13).chr
    elsif [*('n'..'z'), *('N'..'Z')].include?(letter)
      # new_arr += 
      new_arr << (letter.ord - 13).chr
    end
  end
  new_arr
end

NAMES.each do |name|
  puts decrypt(name)
end

# Puneyrf Onoontr
# Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
# Wbua Ngnanfbss
# Ybvf Unvog
# Pynhqr Funaaba
# Fgrir Wbof
# Ovyy Tngrf
# Gvz Orearef-Yrr
# Fgrir Jbmavnx
# Xbaenq Mhfr
# Fve Nagbal Ubner
# Zneiva Zvafxl
# Lhxvuveb Zngfhzbgb
# Unllvz Fybavzfxv
# Tregehqr Oynapu"]

