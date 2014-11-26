def get_response(input)
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  /#{key}/ =~ input
  response = RESPONSES[key]
  response.nil? ? 'sorry?' : response % { c1: $1, c2: $2}
end

RESPONSES = { 'goodbye' => 'bye', 
              'sayonara' => 'sayonara', 
              'the weather is (.*)' => 'I hate it when it\'s %{c1}', 
              'I love (.*)' => 'I love %{c1} too', 
              'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}',
              'How are you?' => 'I\'m great thanks, you?',
              'What\'s your name?' => 'They call me Dangermouse.',
              'Do you believe that (.*) exists?' => 'Yes, I\'m super gullible',
              'What does crossing (.*) with (.*) get?' => '%{c1} and %{c2} soup?',
              'You are (.*)' => ' Your mum is (.*)' }

puts "Hello, what's your name?"
name = gets.chomp
puts "Hello #{name}"
while(input = gets.chomp) do
  puts get_response(input)
end
