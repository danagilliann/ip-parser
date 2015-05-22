#!/usr/bin/env ruby
#
# log-ipsnarf.rb
#
# Small utility program to collect ip addresses and hostnames from logfiles. 
# Also collects hostnames and finds the IP address of it using resolv.
# Very useful if you want to collect IP addresses from IRC logs ;)
#
# Author: Gordon Robert Speirs <grs@xhdev[~dot~]com
# http://www.xhdev.com
#

require 'resolv'

def ipsnarf(inputfile, outputfile)
  if !File.exists?(inputfile)
    puts "log-ipsnarf: Input file does not exist!\n"
    exit
  end

  input = File.open(inputfile, 'r')
  output = File.open(outputfile, 'a+')

  snarf_hosts(input, output)
  snarf_ipaddr(input, output)

  input.close
  output.close
end

def snarf_hosts(input, output)
  host_regex = /(?:[a-z0-9\-]+\.)+[a-z]+/

  input.each_line do |line|
    next unless host = line.match(host_regex)
    begin
      ip = Resolv.getaddress("#{host}")
    rescue
      next
    end
    puts "#{ip}" # print to term for debugging
    output.write("#{ip}\n")
  end
end

def snarf_ipaddr(input, output)
  ip_addr_regex = /\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/

  input.each_line do |line|
    next unless ip_addr = line.match(ip_addr_regex)
    puts "#{ip_addr}" # print to term for debugging
    output.write("#{ip_addr}\n")
  end
end

if __FILE__ == $PROGRAM_NAME
  unless ARGV.length == 2
    puts "Invalid argument length!"
    puts "Usage: ruby log-ipsnarf.rb <inputfile> <outputfile>\n"
    exit
  end

  inputfile = ARGV[0]
  outputfile = ARGV[1]

  ipsnarf(inputfile, outputfile)
end

