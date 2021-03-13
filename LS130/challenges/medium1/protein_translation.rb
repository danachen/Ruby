class InvalidCodonError < StandardError
end

class Translation
  attr_accessor :input_str

  DICTIONARY = {AUG: 'Methionine',
                UUU: 'Phenylalanine', UUC: 'Phenylalanine',
                UUA: 'Leucine', UUG: 'Leucine',
                UCU: 'Serine',  UCC: 'Serine', UCA: 'Serine', UCG:'Serine',
                UAU: 'Tyrosine', UAC: 'Tyrosine',
                UGU: 'Cysteine', UGC: 'Cysteine',
                UGG: 'Tryptophan', 
                UAA: 'STOP', UAG: 'STOP', UGA: 'STOP' }

  def self.of_codon(input)
    @input_str = input
    if valid?(input)
      DICTIONARY[input.to_sym]
    else 
      raise InvalidCodonError, "InvalidCodonError" if !valid?(input)
    end
  end

  def self.of_rna(input)
    @input_str = input
    new_arr = []
    codon_cleaning.select do |codon| 
      new_arr << of_codon(codon) if DICTIONARY[codon.to_sym] != 'STOP'
      break if DICTIONARY[codon.to_sym] == 'STOP'
    end
    new_arr.uniq
  end

  private

  def self.codon_cleaning
    @input_str.scan(/.{3}/)
  end

  def self.valid?(codon)
    DICTIONARY.include?(codon.to_sym)
  end
end