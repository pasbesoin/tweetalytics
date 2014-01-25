#!/usr/bin/env ruby

# Module: Processor
# Description: This module processes the loaded tweets to formats that are
# better for analysis.

module Processor

  # Returns the tweets that are in English
  def get_en_lang(tweets)
    en_lang_tweets = Array.new
    for tweet in tweets
      if tweet["lang"] == "en"
        en_lang_tweets.push(tweet)
      end
    end
    return en_lang_tweets
  end

  # Returns the tweets posted by users whose language is English
  def get_en_user_lang(tweets)
    en_user_lang_tweets = Array.new
    for tweet in tweets
      if tweet["user"]["lang"] == "en"
        en_user_lang_tweets.push(tweet)
      end
    end
    return en_user_lang_tweets
  end

  # Gets the raw, unmodified, text in each tweet.
  def get_raw_text(tweets)
    raw_text = Array.new
    for tweet in tweets
      raw_text.push(tweet["text"])
    end
    return raw_text
  end

  # Gets the raw, unmodified, text in each tweet from tweets in English
  def get_en_lang_raw_text(tweets)
    en_lang_raw_text = Array.new
    for tweet in tweets
      if tweet["lang"] == "en"
        en_lang_raw_text.push(tweet["text"])
      end
    end
    return en_lang_raw_text
  end

  # Gets the raw, unmodified, text in each tweet from tweets by users whose language is English
  def get_en_user_lang_raw_text(tweets)
    en_user_lang_raw_text = Array.new
    for tweet in tweets
      if tweet["user"]["lang"] == "en"
        en_user_lang_raw_text.push(tweet["text"])
      end
    end
    return en_user_lang_raw_text
  end

  # This delimits text by space.
  def delimit_text(text)
    delimited_text = Array.new
    for string in text
      delimited_text.push(string.split())
    end
    return delimited_text
  end

  # Removes each URL from each tweet in a set of tweets.
  def remove_urls(tweets)
    no_url_text_array = Array.new
    for i in (0...tweets.length)
      raw_text = tweets[i]["text"]
      no_url_text = ""
      first = ""
      rest = raw_text
      start = 0
      end_i = 0
      length_of_prev_urls = 0
      for j in (0...tweets[i]["entities"]["urls"].length)
        start_index = tweets[i]["entities"]["urls"][j]["indices"][0]
        end_index = tweets[i]["entities"]["urls"][j]["indices"][1]
        start = start_index - (no_url_text.length + length_of_prev_urls)
        end_i = end_index - (no_url_text.length + length_of_prev_urls)
        first = raw_text[0...start]
        rest = raw_text[end_i...raw_text.length]
        no_url_text += first
        raw_text = rest
        length_of_prev_urls = length_of_prev_urls + (end_i - start)
      end
      no_url_text += rest
      no_url_text_array.push(no_url_text)
    end
    return no_url_text_array
  end

  # Finds each URL in a tweet and returns an array of indices
  def find_urls(tweet)
    pass
  end

  # Account for user mentions urls
  # for k in (0...tweets[i]["entities"]["user_mentions"].length)
  #   start_index = tweets[i]["entities"]["user_mentions"][k]["indices"][0]
  #   end_index = tweets[i]["entities"]["user_mentions"][k]["indices"][1]
  #   start = start_index - (no_url_text.length + length_of_prev_urls)
  #   end_i = end_index - (no_url_text.length + length_of_prev_urls)
  #   first = raw_text[0...start]
  #   rest = raw_text[end_i...raw_text.length]
  #   no_url_text += first
  #   raw_text = rest
  #   length_of_prev_urls = length_of_prev_urls + (end_i - start)
  # end
  # $processed_text[7]
  # $processed_text[9]
  # $processed_text[17]
  # $tweets[7]["retweeted_status"]["entities"]["media"]
  # $tweets[7]["retweeted_status"]["entities"]["media"][0]["url"]
  # $tweets[7]["retweeted_status"]["entities"]["media"][0]["indices"]

  # Return the words in a tweet, not including punctuation.
  def extract_words(text)
    new_str = ""
    text.each_char do |char|
      if char.match(/[a-zA-Z\']/)
        new_str += char
      else
        new_str += " "
      end
    end
    new_new_str = new_str.split()
    return new_new_str
  end

  # Return an array of words in each tweet.
  def tweet_words(no_urls_text)
    processed_text = Array.new
    for i in (0...no_urls_text.length)
      processed_text.push(extract_words(no_urls_text[i]))
    end
    return processed_text
  end

  def process(tweets)
    en_lang_tweets = get_en_lang(tweets)
    no_urls_text = remove_urls(en_lang_tweets)
    processed_text = tweet_words(no_urls_text)
    return processed_text
  end

end