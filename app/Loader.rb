#!/usr/bin/env ruby

# Module: Loader
# Description: This module loads a json file of tweets into Python.

require 'json'

# Function: Load Tweets
# Description: This function take in a .json file and appends each line in the
# .json file to a list (initially empty). Each entry in the resulting list will
# be a dictionary representing a tweet.
def load(json_file, folder="")
  tweets = []
  file = File.open(folder + "data/#{json_file}.json")
  lines = file.readlines()
  for line in lines
    tweets.push(JSON.parse(line))
  end
  return tweets
end
