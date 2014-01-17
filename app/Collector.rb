#!/usr/bin/env ruby

# Module: Collector
# Description: This module collects tweets using twurl and the Twitter API and
# puts the collected tweets into a .json file.

module Collector

  # This is a function for collecting tweets.
  def collect(number_of_tweets=nil, filename=nil, stream_type=nil)
    error = check_error(number_of_tweets, filename, stream_type)
    if error
      return
    end
    filename_array = filename.split()
    filename_without_spaces = ""
    for i in filename_array
      filename_without_spaces += i
      filename_without_spaces += "_"
    end
    new_filename = filename_without_spaces.chop
    if stream_type.class == Array
      bounding_box = convert_bounding_box(stream_type)
      cmd = "twurl -d locations=#{bounding_box} -H stream.twitter.com /1.1/statuses/filter.json > data/#{new_filename}.json"
    elsif stream_type.class == String
      keyword = stream_type
      cmd = "twurl -d track=#{keyword} -H stream.twitter.com /1.1/statuses/filter.json > data/#{new_filename}.json"
    end
    file = File.open("data/#{new_filename}.json", "w+")
    pid = Process.spawn(cmd)
    while true
      number_of_lines = IO.readlines("data/#{new_filename}.json").length
      if number_of_lines >= number_of_tweets
        Process.detach(pid)
        Process.detach(pid + 1)
        Process.kill("SIGKILL", pid)
        Process.kill("SIGKILL", pid + 1)
        break
      end
    end
    file.close
    number_of_lines = IO.readlines("data/#{new_filename}.json").length
    if number_of_lines > number_of_tweets
      remove(number_of_tweets, new_filename)
    end
    File.rename("data/#{new_filename}.json", "data/#{filename}.json")
    puts "Successful!"
    puts "#{number_of_tweets} tweets collected."
    puts "You can find your tweets at tweetalytics/data/#{filename}.json"
    return
  end

  # This function removes extra tweets.
  def remove(number_of_tweets, filename)
    file = File.open("data/#{filename}_new.json", "w+")
    lines = IO.readlines("data/#{filename}.json")
    i = 0
    while i < number_of_tweets
      file.write(lines[i])
      i += 1
    end
    file.close
    File.delete("data/#{filename}.json")
    File.rename("data/#{filename}_new.json", "data/#{filename}.json")
    return
  end

  # This function converts a bounding_box array to a string.
  def convert_bounding_box(bounding_box)
    bounding_box_str = ""
    count = 0
    for coordinate in bounding_box
      bounding_box_str += coordinate.to_s
      count += 1
      if count < bounding_box.length
        bounding_box_str += ","
      end
    end
    return bounding_box_str
  end

  # This function checks for potential errors.
  def check_error(number_of_tweets, filename, stream_type)
    if (number_of_tweets.class != Fixnum)
      puts "Error: 0 tweets collected."
      puts "The number of tweets is not defined properly."
      return true
    elsif (filename.class != String)
      puts "Error: 0 tweets collected."
      puts "The filename is not defined properly."
      return true
    elsif (stream_type.class != Array) and (stream_type.class != String)
      puts "Error: 0 tweets collected."
      puts "The Stream Type is not defined properly."
      return true
    elsif stream_type.class == Array
      if (stream_type.length != 4)
        puts "Error: 0 tweets collected."
        puts "Invalid Bounding Box."
        puts "Not enough coordinates."
        return true
      elsif (stream_type[0] >= stream_type[2]) or (stream_type[1] >= stream_type[3])
        puts "Error: 0 tweets collected."
        puts "Invalid Bounding Box."
        puts "The coordinates are invalid."
        return true
      end
    else
      return false
    end
  end

end