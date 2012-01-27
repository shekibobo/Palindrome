#!/usr/bin/env ruby

require_relative "palindrome"
require "test/unit"
require "benchmark"

class TestKeygen < Test::Unit::TestCase
  def setup
    @string = "abacdfgdcabaypqqpy"
    @long_string = "abacdfgdcabaypqqpyabacdgfdcasjdkfljaioskdke"
    @superlong_string = "ybd" * 33 + @string
  end

  def test_single_letter_palindrome
    assert_equal "a", Palindrome.find_longest_palindrome("a")
  end

  def test_find_longest_palindrome
    assert_equal "ypqqpy", Palindrome.find_longest_palindrome(@string)
  end

  def test_find_longest_palindrome_reverse
    assert_equal "ypqqpy", Palindrome.find_longest_palindrome(@string.reverse)
  end

  def test_find_longest_palindrome_long
    assert_equal s = @string + @string.reverse, Palindrome.find_longest_palindrome(s)
  end

  def test_find_longest_palindrome_longer
    assert_equal "acdfgdcabaypqqpyabacdgfdca", Palindrome.find_longest_palindrome(@long_string)
  end

  def test_find_longest_palindrome_shorter
    assert_equal "ypqqpy", Palindrome.find_longest_palindrome(@string.reverse + "y")
  end

  def test_find_longest_palindrome_shorter_reverse
    assert_equal "ypqqpy", Palindrome.find_longest_palindrome((@string.reverse + "y").reverse)
  end

  def test_find_longest_palindrome_superlong
    assert_equal "ypqqpy", Palindrome.find_longest_palindrome(@superlong_string)
  end

#  def test_performance
#    Benchmark.bm do |b|
#      b.report("time: ") do
#        1_000_000.times { Palindrome.find_longest_palindrome @string }
#      end
#    end
#
#    Benchmark.bm do |b|
#      b.report("time: ") do
#        1_000_000.times { Palindrome.find_longest_palindrome @string.reverse }
#      end
#    end
#
#    Benchmark.bm do |b|
#      b.report("time: ") do
#        1_000_000.times { Palindrome.find_longest_palindrome @string + @string.reverse }
#      end
#    end
#
#    Benchmark.bm do |b|
#      b.report("time: ") do
#        1_000_000.times { Palindrome.find_longest_palindrome @long_string }
#      end
#    end
#  end
end
