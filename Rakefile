# Rakefile

desc "Defaults to noop"
task :default do |t|

end

desc "Install configuration files"
task :install do |t|
	home = File.expand_path('~')
	FileUtils.symlink(Dir.pwd, File.join(home, '.vim'), :force => true)
	FileUtils.symlink(File.join(Dir.pwd, 'vimrc'), File.join(home, '.vimrc'), :force => true)
end

