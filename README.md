# noise

Noise generation library in Crystal

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  noise:
    github: maxpowa/noise
```

## Usage

```crystal
require "noise"

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
```

Only 2d Perlin noise generation is supported, other noise generators may be
added in the future.

## Contributing

1. Fork it ( https://github.com/maxpowa/noise/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [maxpowa](https://github.com/maxpowa) Max Gurela - creator, maintainer
