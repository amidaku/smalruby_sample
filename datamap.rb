require "smalruby"

exit if ARGV.length < 1

color = Array.new(256, 0)
data = IO.binread(ARGV[0])
data_array = data.split("")
data_array.each{|byte|
  val = byte.ord
  color[val] += 1
}

i = 0
canvas = Canvas.new(color: [1, 1, 1])
canvas.on(:start) do
  box_fill(x1: 5, y1: 0, x2: 255 + 15, y2: 305, color: [250, 250, 250])
  coefficient = color.max / 255.0
  color.each{|num|
    value = num.to_f / coefficient
    line(x1: i + 10, y1: 300, x2: i + 10, y2: 300 - value, color: [0, 0, i])
    i += 1
  }
end
