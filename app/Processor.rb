#!/usr/bin/ruby

# Module: Processor
# Description: This module processes the loaded tweets to formats that are better for analysis.
# processed text will be in english, delimited, and without URLs

# from string import ascii_letters

# Gets the raw, unmodified, text in each tweet.
def get_raw_text(tweets)
  raw_text = []
  for tweet in tweets
    raw_text.push(tweet["text"])
  end
  return raw_text
end

# Removes the tweets that are not in English.
def remove_non_en_lang(tweets)
  en_lang_tweets = []
  for tweet in tweets
    if tweet["lang"] == "en"
      en_lang_tweets.push(tweet)
    end
  end
  return en_lang_tweets
end

# Removes the URLs from each tweet
def remove_urls(tweets)
  no_url_text_array = []
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

# Return the words in a tweet, not including punctuation.
def extract_words(text)
  new_str = ""
  text.split("").each do |letter|
    if letter.match(/[a-zA-Z]/)
      new_str += letter
    else
      new_str += " "
    end
  end
  new_new_str = new_str.split()
  return new_new_str
end

# Return an array of words in each tweet.
def tweet_words(no_urls_text)
  processed_text = []
  for i in (0...no_urls_text.length)
    processed_text.push(extract_words(no_urls_text[i]))
  end
  return processed_text
end

def process(tweets)
  no_urls_text = remove_urls(tweets)
  processed_text = tweet_words(no_urls_text)
  return processed_text
end
