#!/usr/bin/env ruby

$: << '.'
$: << File.join(File.dirname(__FILE__), "../lib")
$: << File.join(File.dirname(__FILE__), "../ext")

require 'oj'

Oj.load(%|{"time":"2021-08-16 12:12:15","a":"5","b":"5"|)
