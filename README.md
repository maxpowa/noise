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

## Benchmarks

Benchmarks run on a Mid 2015 Macbook Pro with a 2.2GHz Intel Core i7

```
> crystal run --release samples/perlin2d.bm.cr
                          32x32 perlin noise generation   4.42k (226.33µs) (± 1.07%)          fastest
                        512x512 perlin noise generation  19.53  ( 51.21ms) (±10.42%)   226.27× slower
                      4096x4096 perlin noise generation   0.33  (  3.04s ) (± 0.72%) 13448.52× slower
   32x32, 0.048 scale, 8 octave perlin noise generation 556.04  (   1.8ms) (± 3.22%)     7.95× slower
 128x128, 0.048 scale, 8 octave perlin noise generation  35.17  ( 28.44ms) (± 0.99%)   125.64× slower
 256x256, 0.048 scale, 8 octave perlin noise generation   8.48  (117.86ms) (± 4.47%)   520.77× slower
  32x32, 0.048 scale, 64 octave perlin noise generation  76.64  ( 13.05ms) (± 5.16%)    57.65× slower
128x128, 0.048 scale, 64 octave perlin noise generation   5.06  (197.71ms) (± 3.30%)   873.55× slower
256x256, 0.048 scale, 64 octave perlin noise generation   1.21  (828.26ms) (± 2.78%)  3659.56× slower
```

## Contributing

1. Fork it ( https://github.com/maxpowa/noise/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [maxpowa](https://github.com/maxpowa) Max Gurela - creator, maintainer
