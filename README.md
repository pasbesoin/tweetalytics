# Tweetalytics #

Welcome to Tweetalytics! This is a tool for collecting and analyzing tweets.

## Setup ##

1\. <a href="https://twitter.com/signup" target="_blank">Create a Twitter Account</a>

2\. <a href="https://dev.twitter.com/apps" target="_blank">Sign into Twitter Developers with your Twitter Account</a>

3\. Create a Twitter Application

4\. Set the Access Level to "Read and write"

5\. Create an Access Token

6\. Install oauth

```bash
sudo gem i oauth
```

7\. Install twurl

```bash
sudo gem i twurl
```

8\. Begin the authorization of your Twitter account to make API requests

```bash
twurl authorize --consumer-key key --consumer-secret secret
```

* `key` is your application's consumer-key

* `secret` is your application's consumer-secret

9\. Enter the returned URL into your browser

10\. Click "Authorize app"

11\. Enter the returned PIN back into the terminal

12\. <a href="https://github.com/tweetalytics/tweetalytics/archive/master.zip" target="_blank">Download this repository</a>

## Getting Started ##

To begin using this tool, make sure your current directory is the tweetalytics repository and type in the following command:

```bash
irb -r ./Run.rb
```

### Collect Tweets ###

There are two ways to collect tweets: first, by specifying a bounding box, which is an array that consists of bottom-left-longitude, bottom-left-latitude, top-right-longitude, and top-right-latitude coordinates, and second, by specifying a certain keyword you want to track.

#### How to stream tweets from a certain location ####

Use the collect function and specify how many tweets you want, the name of the file you will create, and a bounding box.

For example:

```ruby
> collect(25, "tweets", United_States)
```

#### How to track a certain keyword ####

Use the collect function and specify how many tweets you want, the name of the file you will create, and the keyword.

For example:

```ruby
> collect(25, "tweets", "obama")
```

### Load Tweets ###

The next thing to do is to load the tweets you just collected into Ruby.

#### How to load tweets in a JSON file into Ruby ####

For example:

```ruby
> tweets = load("tweets")
```

### Process Tweets ###

Now process the tweets you just loaded in.

#### How to process tweets ####

For example:

```ruby
> processed_text = process(tweets)
```

or if you don't want to process the tweets:

```ruby
> raw_text = get_raw_text(tweets)
```

### Analyze Tweets ###

Then analyze the tweets.

#### How to run a character analysis ####

For example:

```ruby
> character_statistics = character_analysis(raw_text)
```

#### How to find the most popular words in a set of tweets. ####

For example:

```ruby
> most_popular_words = top_words(5, processed_text)
```

### Commands for fun ###

#### How to post a tweet ####

* Use the post function and specify your tweet.

For example:

```ruby
>>> post("Hello World!")
```

## License ##

The MIT License (MIT)

Copyright (c) 2014 Paul Land

## Problems ##

If you find any issues please [report them](https://github.com/tweetalytics/tweetalytics/issues) or send a [pull request](https://github.com/tweetalytics/tweetalytics/pulls).
