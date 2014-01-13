#!/usr/bin/ruby

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
  mean_length_of_tweet = mean(array_of_numbers)
  return mean_length_of_tweet
end

# Measures the median number of characters of a set of tweets
def median_number_of_characters(array_of_text)
  array_of_numbers = number_of_characters(array_of_text)
  median_length_of_tweet = median(array_of_numbers)
  return median_length_of_tweet
end

# Measures the median number of characters of a set of tweets
def mode_number_of_characters(array_of_text)
  array_of_numbers = number_of_characters(array_of_text)
  mode_length_of_tweet = mode(array_of_numbers)
  return mode_length_of_tweet
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
def top(x, processed_text)
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
  set.keep_if { |k, v| not $dead_words.include?(k) }
  min_of_most_popular = set.values.top(x)[0]
  set.select! { |k, v| v >= min_of_most_popular }
  if set.length > x
    set_copy = set.clone
    set_length = set.keep_if { |k, v| v > min_of_most_popular }.length
    set_copy = set_copy.select { |k, v| v == min_of_most_popular }
    room = x - set_length
    largest_words = set_copy.keys.top(room)[0]
    subset = set_copy.select { |k, v| k.length >= largest_words }
    subset.each do |k, v|
      set.store(k, v)
    end
  end
  return set
end

$dead_words = ["the", "a", "to", "is", "an", "of", "and", "or", "it"]

class Array
  def top(x)
    if self.length < x
      puts "Error"
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
