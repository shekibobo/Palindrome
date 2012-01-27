#!/usr/bin/env ruby

class Palindrome

#  Recursive, doesn't seem to work too well.
#  def self.find_longest_palindrome(string)
#    s = string
#    if s == s.reverse
#      s
#    else
#      a = s.rindex s[0]
#      b = s[0..a]
#      if a == 0 || b != b.reverse
#        self.find_longest_palindrome(s[1..-1])
#      else
#        self.find_longest_palindrome b
#      end
#    end
#  end


  def self.find_longest_palindrome(string)
#    l = ""
#    string.size.times do |i|
#      break if string.size - i <= l.size
#      a = string.rindex string[i]
#      next if i == a
#      b = string[i..a]
#      l = b if b == b.reverse && b.size > l.size
#    end
#    l
################# My Best Solution ############################################
    return string if string.length == 1
    l = ""
    string.size.times do |i|
      break if string.size - i <= l.size
      c = -1
      while (a = string.rindex(string[i], c)) != i || a - i > l.size do
        b = string[i..a]
        l = b if b == b.reverse && b.size > l.size
        c = a - 1
      end
    end
    l
###############################################################################
  end
end
