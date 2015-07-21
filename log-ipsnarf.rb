# Make a method for parsing the input

require 'ipaddr'

def main()
  input = File.open('log', 'r')
  #output = File.open(output, 'a+')
  output = {}

  check_input(input)
  parsing_file(input, output)

  input.close
end

def check_input(input)
  if !File.exists?(input)
    puts 'The input file does not exist!'
    exit
  end 
end

def parsing_file(input, output)
  count = 0
  ip_regex = /\d{1,3}\.\d{1,3}\.\d{1,3}.\d{1,3}/
  ip_list = []

  input.each do |line|
    ip_list << line.scan(ip_regex)
  end

  puts ip_list

  #counts_input(ip_address, output)
end

def counts_input(input, output)
  count = 0

  input.each do |element|
    count += input.count(element)
    output[element] = count 
  end
  puts output
end  

main()

  