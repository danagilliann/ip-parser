# Make a method for parsing the input
# By the way, this takes around 2hours for a file that has around 160,000 lines :/

def main()
  input = File.open('log', 'r') # This is where the script opens the file
  #output = File.open(output, 'a+')
  output = {}

  check_input(input)
  ip_list = parsing_file(input)
  counts_input(ip_list, output)

  input.close
end

def check_input(input)
  if !File.exists?(input)
    puts 'The input file does not exist!'
    exit
  end 
end

def parsing_file(input)
  count = 0
  ip_regex = /\d{1,3}\.\d{1,3}\.\d{1,3}.\d{1,3}/
  ip_list = []
  ip_address = ''

  input.each do |line|
    ip_list << line.scan(ip_regex)
  end

  return ip_list
end

def counts_input(input, output)
  count = 0

  input.each do |element|
    count += input.count(element)
    output[element] = count 
    count = 0
  end
  puts output
end  

main()

  