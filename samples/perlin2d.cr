require "../src/noise"

symbols = [' ', '·', 'l', '░', '▒', '█']
pixels = Array.new(32) { Array.new(128, 0.0) }

perlin = Noise::Perlin.new

# scale = 0.045
scale = 0.048
persistence = scale / 2

32.times do |y|
  128.times do |x|
    v = perlin.fractal(4, persistence, scale, x.to_f, y.to_f) * 0.5 + 0.5
    pixels[y][x] = v
    print(symbols[(v * 6).to_i])
  end
  puts
end
