#!/usr/bin/ruby

# Module: Run
# Description: Run the application.

require './app/Collector'
require './app/Loader'
require './app/Processor'
require './app/Analyzer'
require './app/Poster'
require './app/data/bounding_boxes'

$json_file = "SampleTweets2"

$tweets = load($json_file)
$en_lang_tweets = get_en_lang($tweets)
$en_user_lang_tweets = get_en_user_lang($tweets)
$raw_text = get_raw_text($tweets)
$en_lang_raw_text = get_en_lang_raw_text($tweets)
$en_user_lang_raw_text = get_en_user_lang_raw_text($tweets)

$delimited_raw_text = delimit_text($raw_text)
$processed_text = process($tweets)

$num_of_char = number_of_characters($raw_text)
$total_num_of_char = total_number_of_characters($raw_text)
$max_num_of_char = maximum_number_of_characters($raw_text)
$min_num_of_char = minimum_number_of_characters($raw_text)
$mean_num_of_char = mean_number_of_characters($raw_text)
$med_num_of_char = median_number_of_characters($raw_text)
$mode_num_of_char = mode_number_of_characters($raw_text)

$top_5_processed_text = top_words(5, $processed_text)
$top_5_delimited_raw_text = top_words(5, $delimited_raw_text)
