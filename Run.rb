#!/usr/bin/env ruby

# Module: Run
# Description: Run the application.

require './app/Collector'
require './app/Loader'
require './app/Processor'
require './app/Analyzer'
require './app/Poster'
require './app/data/bounding_boxes'
include Collector
include Loader
include Processor
include Analyzer
include Poster
include BoundingBox

# $json_file = "SampleTweets2"
# 
# $tweets = Loader.load($json_file)
# $en_lang_tweets = Processor.get_en_lang($tweets)
# $en_user_lang_tweets = Processor.get_en_user_lang($tweets)
# $raw_text = Processor.get_raw_text($tweets)
# $en_lang_raw_text = Processor.get_en_lang_raw_text($tweets)
# $en_user_lang_raw_text = Processor.get_en_user_lang_raw_text($tweets)
# 
# $delimited_raw_text = Processor.delimit_text($raw_text)
# $processed_text = Processor.process($tweets)
# 
# $num_of_char = Analyzer.number_of_characters($raw_text)
# $total_num_of_char = Analyzer.total_number_of_characters($raw_text)
# $max_num_of_char = Analyzer.maximum_number_of_characters($raw_text)
# $min_num_of_char = Analyzer.minimum_number_of_characters($raw_text)
# $mean_num_of_char = Analyzer.mean_number_of_characters($raw_text)
# $med_num_of_char = Analyzer.median_number_of_characters($raw_text)
# $mode_num_of_char = Analyzer.mode_number_of_characters($raw_text)
# 
# $character_statistics = Analyzer.character_analysis($raw_text)
# 
# $top_5_processed_text = Analyzer.top_words(5, $processed_text)
# $top_5_delimited_raw_text = Analyzer.top_words(5, $delimited_raw_text)

# puts $top_5_processed_text
