#!/usr/bin/ruby

require './app/Collector'
require './test/CollectorTests'
require 'stringio'

Expected_Output = [
"Error: 0 tweets collected.\nThe number of tweets is not defined properly.\n",
"Error: 0 tweets collected.\nThe filename is not defined properly.\n",
"Error: 0 tweets collected.\nThe Stream Type is not defined properly.\n",
"Error: 0 tweets collected.\nInvalid Bounding Box.\nNot enough coordinates.\n",
"Error: 0 tweets collected.\nInvalid Bounding Box.\nThe coordinates are invalid.\n",
]

Collected_Output = []
Collected_Output.push(collect_the_output(0, "10", "tweets", "obama"))
Collected_Output.push(collect_the_output(0, "10", "tweets", [23, 23, 24, 24]))
Collected_Output.push(collect_the_output(1, 10, ["tweets"], "obama"))
Collected_Output.push(collect_the_output(1, 10, ["tweets"], [23, 23, 24, 24]))
Collected_Output.push(collect_the_output(2, 10, "tweets", 23))
Collected_Output.push(collect_the_output(3, 10, "tweets", [23, 23, 23]))
Collected_Output.push(collect_the_output(4, 10, "tweets", [24, 24, 23, 23]))
