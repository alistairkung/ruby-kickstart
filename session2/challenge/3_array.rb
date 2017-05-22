# Write a method named every_other_char for strings that,
# returns an array containing every other character
#
# example:
# "abcdefg".every_other_char  # => "aceg"
# "".every_other_char         # => ""

class String
  def every_other_char
    everyotherchar = ''
    each_char.with_index do |char,index|
      everyotherchar << char if index.even?
    end
  everyotherchar
  end
end
