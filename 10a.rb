tiles = File.readlines('10in').map(&:chars)

start = []
tiles.each_with_index do |line, i|
  j = line.index('S')
  if j
    start = [i, j]
    break
  end
end

def next_pipe(x, y, pipes, tiles)
  possibility = {
    '|' => [[-1, 0], [1, 0]],
    '-' => [[0, -1], [0, 1]],
    'L' => [[-1, 0], [0, 1]],
    'J' => [[-1, 0], [0, -1]],
    '7' => [[1, 0], [0, -1]],
    'F' => [[1, 0], [0, 1]],
    'S' => [[-1, 0], [1, 0], [0, -1], [0, 1]]
  }
  (possibility[tiles[x][y]].map { |i, j| [i + x, j + y] }).delete_if { |pipe| pipes[-2] == pipe }
end

pipes = []
pipes << next_pipe(start[0], start[1], pipes, tiles).find do |pipe|
  next_pipe(pipe[0], pipe[1], pipes, tiles).include? start
end

pipes << next_pipe(pipes[-1][0], pipes[-1][1], pipes, tiles)[0] until pipes[-1] == start

puts pipes.count / 2
