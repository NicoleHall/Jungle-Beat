require_relative '../lib/jungle_beat'

puts ARGV
input_file = ARGV[0]


input_file = File.open(input_file)
lines = input_file.read


static_jb = JungleBeat.new("Doop")

static_jb.append(lines)
static_jb.play
