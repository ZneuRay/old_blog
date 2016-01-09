#!/usr/bin/ruby

require 'digest'
require 'fileutils'

image_dir = "../source/images/blog"

abort "argument error" unless ARGV.size == 1

src = ARGV[0]

files = []

if File.directory? src
	Dir.foreach(src) do |f|
		next if f.start_with? "."
		# files["#{src}/#{f}"] = "#{Digest::SHA1.file("#{src}/#{f}").to_s}#{File.extname f}"
		files << {path: "#{src}/#{f}", filename: f, new_file: "#{Digest::SHA1.file("#{src}/#{f}").to_s}#{File.extname f}"}
	end
end
if File.file? src
	f = File.basename src
	# files[src] = "#{Digest::SHA1.file("#{src}/#{f}").to_s}#{File.extname f}"
	files << {path: "#{File.dirname src}", filename: f, new_file: "#{Digest::SHA1.file("#{src}").to_s}#{File.extname f}"}
end

# print files

folder = Digest::SHA1.hexdigest(Time.now.strftime("%x"))[0...20]
new_folder = "#{image_dir}/#{folder}"
Dir.mkdir new_folder unless Dir.exist? new_folder

files.each do |f| 
	new_file = "#{new_folder}/#{f[:new_file]}"
	FileUtils.cp f[:path], new_file
	print "{% img /images/blog/#{folder}/#{f[:new_file]} %}"
end

# new_file = Digest::SHA256.hexdigest(Time.now.strftime("%x"))[0...20]


# File.cp src "#{image_dir}"