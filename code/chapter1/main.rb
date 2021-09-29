require 'fileutils'

format_name = ARGV[0]
file_name = ARGV[1]

Dir.glob("./input/*.#{format_name}").each_with_index do |filename, index|
  # ファイル名を置き換える
  new_file = filename.gsub(/.+(?=\.[^.]+$)/) { sprintf("%s%03d", file_name, index) }
  print "#{filename} -> #{new_file}\n"
  FileUtils.mv(filename, "output/#{new_file}")
end