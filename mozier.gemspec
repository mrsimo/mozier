Gem::Specification.new do |gem|
  gem.name    = 'mozier'
  gem.version = '0.0.1'
  gem.date    = Date.today.to_s
  
  gem.summary = "Small library to access backup info from mozy.com"
  
  gem.authors  = ['Albert Llop']
  gem.email    = 'mrsimo@gmail.com'
  gem.homepage = 'http://github.com/albertllop/mozier'
  
  gem.files = ["core_ext/string.rb", "lib/mozier.rb", "mozier.rb"]
end