#!/usr/bin/ruby

# Module: Run
# Description: Run the application.

require './app/Collector'
require './app/Loader'
require './app/Processor'
require './app/Analyzer'
require './app/Poster'
require './app/data/bounding_boxes'

$json_file = "SampleTweets.json"
$tweets = load($json_file, "")
$raw_text = get_raw_text($tweets)
$en_lang_tweets = remove_non_en_lang($tweets)
$no_urls_text = remove_urls($tweets)
$processed_text = process($no_urls_text)
