# Write a program that outputs the lyrics for "Ninety-nine Bottles of Beer on the Wall"
# Your program should print the number of bottles in English, not as a number. For example:
#
# Ninety-nine bottles of beer on the wall,
# Ninety-nine bottles of beer,
# Take one down, pass it around,
# Ninety-eight bottles of beer on the wall.
# ...
# One bottle of beer on the wall,
# One bottle of beer,
# Take one down, pass it around,
# Zero bottles of beer on the wall.
#
# Your program should not use ninety-nine output statements!
# Design your program with a class named BeerSong whose initialize method
# receives a parameter indicating the number of bottles of beer initially on the wall.
# If the parameter is less than zero, set the number of bottles to zero. Similarly,
# if the parameter is greater than 99, set the number of beer bottles to 99
# Then make a public method called print_song that outputs all stanzas from the number of bottles of beer down to zero.
# Add any additional methods you find helpful.
class BeerSong
  attr_accessor :beers

  def initialize(beers)
    beers = 0  if beers < 0
    beers = 99 if beers > 99
    self.beers = beers
  end

  def print_song
    beers.downto 1 do |i|
      print_stanza i
    end
  end

  def print_stanza(n)
    puts "#{translate n} #{bottle n} of beer on the wall,"        ,
         "#{translate n} #{bottle n} of beer,"                    ,
         "Take one down, pass it around,"                         ,
         "#{translate n - 1} #{bottle n-1} of beer on the wall."
  end

  def bottle(n)
    if n == 1 then 'bottle' else 'bottles' end
  end

  def translate(n)
    if 0 <= n && n <= 19
      %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)[n]
    elsif n % 10 == 0
      %w(zero ten twenty thirty forty fifty sixty seventy eighty ninety)[n/10]
    else
      "#{translate n/10*10}-#{translate n%10}".downcase
    end.capitalize
  end

end


#tried this doesn't pass test 6- to revisit
#def translate (n)
#  int_to_word = {
#    90 => "Ninety", 80 => "Eighty", 70 => "Seventy", 60 => "Sixty", 50 => "Fifty", 40 => "Fourty", 30 => "Thirty", 20 => "Twenty", 19=>"Nineteen", 18=>"Eighteen", 17=>"Seventeen",
#    16=>"Sixteen", 15=>"Fifteen", 14=>"Fourteen", 13=>"Thirteen", 12=>"Twelve", 11 => "Eleven", 10 => "Ten", 9 => "Nine", 8 => "Eight", 7 => "Seven", 6 => "Six", 5 => "Five", 4 => "Four", 3 => "Three", 2 => "Two", 1 => "One", 0 => "Zero"
#  }
#
#  str = ""
#  int_to_word.each do |int, word|
#    if int == 0
#      return "Zero"
#    elsif int.to_s.length == 1 && n/int > 0
#      return str + "#{word}"
#    elsif int < 100 && n/int > 0
#      return str + "#{word}" if n%int == 0
#      return str + "#{word}-" + translate(n%int).downcase
#    end
#  end
#end
