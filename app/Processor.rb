#!/usr/bin/env ruby
# encoding: utf-8

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

  def remove_rt(tweets)
    no_rt_text = Array.new
    for tweet in tweets
      if tweet["retweeted_status"] != nil
        start = tweet["text"].index(":") + 2
        no_rt_text.push(tweet["text"][start...tweet["text"].length])
      else
        no_rt_text.push(tweet["text"])
      end
    end
    return no_rt_text
  end

  def extract_without_special_quotes(text)
    new_str = ""
    text.each_char do |char|
      if not char.match(/[\“\”]/)
        new_str += char
      else
        new_str += " "
      end
    end
    return new_str
  end

  # This delimits text by space.
  def delimit_text(tweets)
    delimited_text = Array.new
    no_rt_text = remove_rt(tweets)
    for text in no_rt_text
      delimited_text.push((extract_without_special_quotes(text).split()))
    end
    return delimited_text
  end

  # Removes each URL from each tweet in a set of tweets.
  def remove_urls(tweets)
    no_urls_text_array = Array.new
    delimited_text = delimit_text(tweets)
    # delimited_text = delimit_text(get_raw_text(tweets))
    for i in (0...delimited_text.length)
      for url in tweets[i]["entities"]["urls"]
        delimited_text[i].delete(url["url"])
      end
      if tweets[i]["entities"]["media"] != nil
        for media in tweets[i]["entities"]["media"]
          delimited_text[i].delete(media["url"])
        end
      end
      no_urls_text_array.push(delimited_text[i])
    end
    no_urls_tweets = Array.new
    for tweet in no_urls_text_array
      no_urls_tweets.push(tweet.join(" "))
    end
    return no_urls_tweets
  end

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
