# Make a method for parsing the input

require 'ipaddr'

def main()
  input = File.open('log', 'r')
  #output = File.open(output, 'a+')
  output = {}

  check_input(input)
  array = parsing_file(input)
  puts array
  #match_input(array, output)
  input.close
end

def check_input(input)
  if !File.exists?(input)
    puts 'The input file does not exist!'
    exit
  end 
end

def parsing_file(input)
  ip_regex = /\d{1,3}\.\d{1,3}\.\d{1,3}.\d{1,3}/
  ip_list = []

  input.each do |line|
    ip_list << line.scan(ip_regex)
  end

  return ip_list
end

def match_input(input, output)
  count = 0
  ip_regex = /\d{1,3}\.\d{1,3}\.\d{1,3}.\d{1,3}/

  input.each do |element|
    count += input.count(element)
    output[element] = count 
  end
  puts output
end  

main()

  