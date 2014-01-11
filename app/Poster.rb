#!/usr/bin/ruby

# Module: Poster
# Description: This module posts a tweet using twurl to your timeline.

# This is a function for posting a tweet to your timeline.
def post(tweet, filename="tweet")
  cmd = "twurl -d 'status=#{tweet}' /1.1/statuses/update.json > data/#{filename}.json"
  pid = Process.spawn(cmd)
  Process.waitpid(pid)
  File.delete("data/#{filename}.json")
  return
end
