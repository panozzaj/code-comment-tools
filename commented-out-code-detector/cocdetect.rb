#!/usr/bin/ruby
# Detects commented-out code
#
# Anthony Panozzo - 20100503
# Right now, just trying to make this work for C++
# Will add modularity, etc. when the need arises
#
# Limitations: only handles single-line comments as a filter
# (no awareness between lines, multi-line comments, etc.)

# would be nice to use pretty command-line option generating utils, but I am without internet access at the moment and someone has surely written this


exit if ARGV.empty?

filenames = ARGV

filenames.each do |filename|
  File.open(filename).each_with_index do |line, line_number|
    # should remove all spaces at end, although I don't have documentation right now
    line = line.chomp 
    if line =~ /^\s*\/\// # commented out single lines
      if line =~ /;$/
        puts "#{filename}:#{line_number + 1}\t#{line}"
      end
    end
  end
end
