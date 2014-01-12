#!/usr/bin/ruby

# Module: Test
# Description: Run the application tests.

require './test/CollectorTests'
require './test/LoaderTests'
require './test/ProcessorTests'
require './test/AnalyzerTests'
require './test/data/CollectorTestsData'
require './test/data/ProcessorTestsData'

# CollectorTests

puts "CollectorTests"

# Collect Test

puts "  Collect Tests"
collect_test(Collected_Output)

# LoaderTests

puts "LoaderTests"

# ProcessorTests

puts "ProcessorTests"

# Remove URLs Test

puts "  Remove URLs Tests"
json_test_files = ["RemoveURLsTest1", "RemoveURLsTest2"]
real_output = Real_Remove_Urls_Output
for i in (0...real_output.length)
  puts "    Test #{i + 1}: " + remove_urls_test(json_test_files[i], real_output[i])
end

# Extract Words Tests

puts "  Extract Words Tests"
input_list = Extract_Words_Input
real_output = Real_Extract_Words_Output
for i in (0...real_output.length)
  puts "    Test #{i + 1}: " + extract_words_test(input_list[i], real_output[i])
end

# AnalyzerTests

puts "AnalyzerTests"
