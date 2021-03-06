require 'artoo'

connection :sphero, :adaptor => :sphero, :port => '/dev/rfcomm0' #linux
device :sphero, :driver => :sphero

def contact(*args)
  @contacts ||= 0
  @contacts += 1
  puts "Contact #{@contacts}"
end

work do
  on sphero, :collision => :contact

  every(3.seconds) do
    puts "Rolling..."
    sphero.roll 90, rand(360)
  end
end
