# Make a method for opening the input
# Make a method for parsing the input
  # Make a method for detecting duplicate IP addresses

require 'resolv'

def main()
  input = File.open('log', 'r')
  #output = File.open(output, 'a+')
  output = {}

  match_input(input, output)
  input.close
  #check_input(input)
  #open(input, output)
end

def check_input(input)
  if !File.exists?(input)
    puts 'The input file does not exist!'
    exit
  end 
end

def match_input(input, output)
  count = 0
  ip_regex = /\d{1,3}\.\d{1,3}\.\d{1,3}.\d{1,3}/

  input.each do |element|
    if element.match ip_regex
      count += input.count(element)
      output[element] = count
    end 
  end
  puts output
end  

main()

  