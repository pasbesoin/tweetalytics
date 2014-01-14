#!/usr/bin/env ruby

# Module: Poster
# Description: This module posts a tweet using twurl to your timeline.

# This is a function for posting a tweet to your timeline.
def post(tweet)
  cmd = "twurl -d 'status=#{tweet}' /1.1/statuses/update.json > app/data/tweet.json"
  pid = Process.spawn(cmd)
  Process.waitpid(pid)
  File.delete("app/data/tweet.json")
  return
end
