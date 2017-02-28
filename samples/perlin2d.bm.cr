require "benchmark"
require "../src/noise"

Benchmark.ips do |x|
  # Give this noise generator a custom seed
  perlin = Noise::Perlin.new("benchmark".hash)
  x.report("32x32, 0.048 scale, 8 octave perlin noise generation") {
    32.times do |y|
      32.times do |x|
        perlin.fractal(8, 0.024, 0.048, x * 1.0, y * 1.0) * 0.5 + 0.5
      end
    end
  }
  x.report("128x128, 0.048 scale, 8 octave perlin noise generation") {
    128.times do |y|
      128.times do |x|
        perlin.fractal(8, 0.024, 0.048, x * 1.0, y * 1.0) * 0.5 + 0.5
      end
    end
  }
  x.report("32x32, 0.048 scale, 64 octave perlin noise generation") {
    32.times do |y|
      32.times do |x|
        perlin.fractal(64, 0.024, 0.048, x * 1.0, y * 1.0) * 0.5 + 0.5
      end
    end
  }
  x.report("128x128, 0.048 scale, 64 octave perlin noise generation") {
    128.times do |y|
      128.times do |x|
        perlin.fractal(64, 0.024, 0.048, x * 1.0, y * 1.0) * 0.5 + 0.5
      end
    end
  }
end
