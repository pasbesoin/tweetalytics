#!/usr/bin/ruby

# Module: Analyzer
# Description: This module contains a set of functions for analyzing processed
# tweets. Analysis of the text in tweets data set

# Measures the average number of characters of a set of tweets
def average_number_of_characters(tweets)
  length_of_each_text = []
  for text in tweets
    length_of_each_text.push(text.length)
  end
  average_length_of_tweet = length_of_each_text.reduce(:+) / length_of_each_text.length
  return average_length_of_tweet
end

# Measures the number of times a certain word is used in a set of tweets.
def number_of_occurrences(keyword, tweets)
  count = 0
  for tweet in tweets
    for word in tweet
      if word == keyword
        count += 1
      end
    end
  end
  return count
end
