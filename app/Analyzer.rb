#!/usr/bin/env ruby

# Module: Analyzer
# Description: This module contains a set of functions for analyzing processed
# tweets.

# CHARACTER ANALYSIS:

# 1. Total Number of Characters
# 2. Maximum Number of Characters
# 3. Minimum Number of Characters
# 4. Mean Number of Characters
# 5. Median Number of Characters
# 6. Mode Number of Characters

def number_of_characters(array_of_text)
  number_of_characters_in_each_text = Array.new
  array_of_text.each do |text|
    number_of_characters_in_each_text.push(text.length)
  end
  return number_of_characters_in_each_text
end

# Measures the total number of characters of a set of tweets
def total_number_of_characters(array_of_text)
  array_of_numbers = number_of_characters(array_of_text)
  return sum(array_of_numbers)
end

# Measures the maximum number of characters in a set of tweets
def maximum_number_of_characters(array_of_text)
  array_of_numbers = number_of_characters(array_of_text)
  return array_of_numbers.max
end

# Measures the minimum number of characters in a set of tweets
def minimum_number_of_characters(array_of_text)
  array_of_numbers = number_of_characters(array_of_text)
  return array_of_numbers.min
end

# Measures the average number of characters of a set of tweets
def mean_number_of_characters(array_of_text)
  array_of_numbers = number_of_characters(array_of_text)
  return mean(array_of_numbers)
end

# Measures the median number of characters of a set of tweets
def median_number_of_characters(array_of_text)
  array_of_numbers = number_of_characters(array_of_text)
  return median(array_of_numbers)
end

# Measures the median number of characters of a set of tweets
def mode_number_of_characters(array_of_text)
  array_of_numbers = number_of_characters(array_of_text)
  return mode(array_of_numbers)
end

# Run all character analysis
def character_analysis(raw_text)
  statistics = Hash.new
  statistics.store("char_counts", number_of_characters(raw_text))
  statistics.store("total", total_number_of_characters(raw_text))
  statistics.store("max", maximum_number_of_characters(raw_text))
  statistics.store("min", minimum_number_of_characters(raw_text))
  statistics.store("mean", mean_number_of_characters(raw_text))
  statistics.store("med", median_number_of_characters(raw_text))
  statistics.store("mode", mode_number_of_characters(raw_text))
  return statistics  
end

# STATISTICS

# 1. Sum
# 2. Mean
# 3. Median
# 4. Mode

# Measures the sum of an array of numbers
def sum(array_of_numbers)
  return array_of_numbers.reduce(:+)
end

# Measures the average of an array of numbers
def mean(array_of_numbers)
  return sum(array_of_numbers) / array_of_numbers.length
end

# Measures the median of an array of numbers
def median(array_of_numbers)
  array_of_numbers.sort!
  i = array_of_numbers.length / 2
  if array_of_numbers.length.odd?
    return array_of_numbers[i + 1]
  else
    return mean([array_of_numbers[i], array_of_numbers[i + 1]])
  end
end

# Measures the mode of an array of numbers
def mode(array_of_numbers)
  set = Hash.new
  array_of_numbers.each do |key|
    if set.has_key?(key)
      set[key] += 1
    else
      set.store(key, 1)
    end
  end
  set.select! { |k, v| v == set.values.max }
  return set
end

# PATTERN MATCHING

# Measures the number of times a certain keyword (case-insensitive) is used in a set of tweets.
def number_of_matches(keyword, processed_text)
  count = 0
  for text in processed_text
    for word in text
      if word.casecmp(keyword) == 0
        count += 1
      end
    end
  end
  return count
end

# Measures the number of times a certain keyword (case-sensitive) is used in a set of tweets.
def number_of_exact_matches(keyword, processed_text)
  count = 0
  for text in processed_text
    for word in text
      if word == keyword
        count += 1
      end
    end
  end
  return count
end

# Find the x most popular words used in a set of tweets.
# If more than x words are found initially, then it only keeps the largest words
def top_words(x, processed_text)
  set = Hash.new
  for text in processed_text
    text.each do |word|
      if set.has_key?(word)
        set[word] += 1
      else
        set.store(word, 1)
      end
    end
  end
  set = set.select { |k, v| not $insignificant_words.include?(k) }
  last_popular_word_count = set.values.top(x)[0]
  set = set.select { |k, v| v >= last_popular_word_count }
  if set.length > x
    set_copy = set.clone
    set = set.select { |k, v| v > last_popular_word_count }
    subset = set_copy.select { |k, v| v == last_popular_word_count }
    word_space = x - set.length
    last_large_word_length = subset.keys.top(word_space)[0]
    subset = subset.select { |k, v| k.length >= last_large_word_length }
    subset.each do |k, v|
      set.store(k, v)
    end
  end
  return set
end

$insignificant_words = ["the", "a", "to", "is", "an", "of", "and", "or", "it"]

class Array
  def top(x)
    if self.length < x
      puts "Error"
      puts "The top #{x} values of this Array cannot be found"
      puts "#{x} is greater than the Array's length: #{self.length}"
      return
    else
      if self[0].class == String
        word_lengths = Array.new
        self.each do |word|
          word_lengths.push(word.length)
        end
        word_lengths.sort!
        top_elements = word_lengths.drop(self.length - x)
      else
        self.sort!
        top_elements = self.drop(self.length - x)
      end
      return top_elements
    end
  end
end
