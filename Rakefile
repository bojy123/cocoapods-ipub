require 'bundler/gem_tasks'

def specs(dir)
  FileList["spec/#{dir}/*_spec.rb"].shuffle.join(' ')
end

def build
	sh('gem build cocoapods-ipub.gemspec')
	sh('sudo gem install cocoapods-ipub-0.0.2.gem')
end

desc 'Builds the gem'
task :build do
	build
end

desc 'Runs all the specs'
task :specs do
  sh "bundle exec bacon #{specs('**')}"
end

task :default => :specs

