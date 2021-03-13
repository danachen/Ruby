# Encrypted Pioneers

# Problem: Each of the letters in the string is encrypted, each letter is pushed forward
# in the alphabet by 13 spaces
# Input: string of letters
# Output: string of letters
# Process: how the encryption works: from A-M, and a - m, the ASCII is + 13
# from N - Z, and n-z, the ASCII is -13
# Algo: go through each letter, the ones that are part of the first group, apply +13

NAMES = ['Nqn Ybirynpr',
              'Tenpr Ubccre',
              'Nqryr Tbyqfgvar',
              'Nyna Ghevat',
              'Puneyrf Onoontr',
              'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
              'Wbua Ngnanfbss',
              'Ybvf Unvog',
              'Pynhqr Funaaba',
              'Fgrir Wbof',
              'Ovyy Tngrf',
              'Gvz Orearef-Yrr',
              'Fgrir Jbmavnx',
              'Xbaenq Mhfr',
              'Fve Nagbal Ubner',
              'Zneiva Zvafxl',
              'Lhxvuveb Zngfhzbgb',
              'Unllvz Fybavzfxv',
              'Tregehqr Oynapu']

def decrypt(name)
  arr1 = [*'a'..'m', *'A'..'M']
  arr2 = [*'n'..'z', *'N'..'Z']
  new_arr = []

  name.chars.map do |letter|
    if arr1.include?(letter)
      new_arr << (letter.ord + 13).chr
    elsif arr2.include?(letter)
      new_arr << (letter.ord - 13).chr
    else
      new_arr << letter
    end
  end
  new_arr.join
end

NAMES.each do |name|
  p decrypt(name)
end

