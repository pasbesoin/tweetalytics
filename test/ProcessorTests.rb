#!/usr/bin/env ruby

# Module: Processor Tests
# Description: This module tests the Processor module.

require './app/Loader'
require './app/Processor'
include Loader
include Processor

# Function: Remove URLs Test
# Description: This function tests whether the resulting output of remove_urls
# in the process module matches the expected output.
def remove_urls_test(json_test_file, expected_output)
  tweets = load(json_test_file, "test/")
  resulting_output = remove_urls(tweets)
  if resulting_output == expected_output
    return "Passed"
  else
    return "Failed"
  end
end

def extract_words_test(input_item, expected_output)
  resulting_output = extract_words(input_item)
  if resulting_output == expected_output
    return "Passed"
  else
    return "Failed"
  end
end
