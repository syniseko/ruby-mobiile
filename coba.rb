# arr = ["1.2", "2.9", "2.5", "2.1"]
# arr = ["49.99", "29.99", "15.99", "15.99", "9.99", "7.99"]
arr = ["$49.99", "$15.99", "$15.99", "$9.99", "$7.99","$29.99"]
sortDt = arr.sort_by {|e| -e[/\d+/].to_i }

status = (arr == sortDt)

puts arr
puts "----------"
puts sortDt
puts status