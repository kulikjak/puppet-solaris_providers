source ENV['GEM_SOURCE'] || "https://rubygems.org"

group(:development, :test) do
  gem 'puppetlabs_spec_helper', :require => true
  gem 'rspec-puppet', :require => true
  gem 'rspec', :require => false
  gem 'rake', '>= 13.4.2', :require => false
  gem 'psych', :require => false
  gem 'puppet', '7.27.0', :require => true
  gem 'pkg-config', :require => false
end

gem "rubocop", ">= 0.49.0", :platforms => [:ruby]

gem 'beaker-rspec', :require => false, :group => :acceptance
