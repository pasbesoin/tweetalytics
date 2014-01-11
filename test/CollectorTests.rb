#!/usr/bin/ruby

# Module: Collector Tests
# Description: This module tests the Collector module.

require './app/Collector'

def collect_test(collected_output)
  count = 0
  for (output, expected_output) in collected_output
    count += 1
    if output == expected_output
      puts "    Test #{count}: Passed"
    else
      puts "    Test #{count}: Failed"
    end
  end
end

def capture_stdout
  out = StringIO.new
  $stdout = out
  yield
  return out
ensure
  $stdout = STDOUT
end

def collect_the_output(i, number_of_tweets=nil, filename=nil, stream_type=nil)
  output = capture_stdout do
    collect(number_of_tweets, filename, stream_type)
  end
  output_array = [output.string, Expected_Output[i]]
  return output_array
end


def convert_bounding_box_test()
  pass
end
