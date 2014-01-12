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

### Commands for fun ###

#### How to post a tweet ####

* Use the post function and specify your tweet.

For example:

```ruby
>>> post("Hello World!")
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

#### Bounding Boxes ####

| Region              | Bounding Box                                     |
| ------------------- | ------------------------------------------------ |
| United States       | `-123.587952,25.165173,-66.810608,48.980217    ` |
| Southern California | `-120.021515,32.509762,-116.494389,34.998504   ` |
| Northern California | `-124.476814,36.004673,-119.999027,42.004407   ` |
| New England         | `-73.500279,41.000241,-67.000112,45.000394     ` |
| New York City       | `-74.248567,40.498137,-73.756928,40.876141     ` |
| Los Angeles         | `-119.113984,33.70035,-117.989259,34.330962    ` |
| Chicago             | `-87.880497,41.681118,-87.506962,42.028894     ` |
| Dallas              | `-96.925721,32.676373,-96.678529,32.924555     ` |
| Houston             | `-95.748811,29.548372,-95.107484,30.107118     ` |
| Philadelphia        | `-75.268922,39.882343,-74.966798,40.132691     ` |
| Washington D.C.     | `-77.119653,38.827138,-76.909645,38.99554      ` |
| Miami               | `-80.854311,25.177602,-80.118012,25.971626     ` |
| Atlanta             | `-84.547745,33.65378,-84.28888,33.880962       ` |
| Boston              | `-71.189716,42.233983,-70.98787,42.384923      ` |
| San Francisco       | `-122.505852,37.707998,-122.358223,37.833107   ` |

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

Then analyze the processed tweets.

#### How to analyze the text in tweets ####

For example:

```ruby
> number_of_obama_references = number_of_occurrences("obama", processed_text)
```

or

```ruby
> average_number_of_characters_in_tweets = average_number_of_characters(raw_text)
```

## License ##

The MIT License (MIT)

Copyright (c) 2014 Paul Land

## Problems ##

If you find any issues please [report them](https://github.com/paul-land/tweetalytics/issues) or send a [pull request](https://github.com/paul-land/tweetalytics/pulls).
