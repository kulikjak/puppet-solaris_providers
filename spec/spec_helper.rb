require 'rubygems'
require 'puppetlabs_spec_helper/module_spec_helper'

begin
  require 'pry'
rescue LoadError
  # We mostly don't care if this fails unless
  # we added a call to binding.pry in code for testing
end

RSpec.configure do |config|
  config.mock_with :mocha
  config.example_status_persistence_file_path = 'spec/examples.txt'

  # Resolve and cache provider-selection facts before specs install strict
  # FileTest stubs for Solaris binaries. Otherwise, Facter may check its own
  # fact files after those stubs are active, causing failures.
  config.before(:suite) do
    %i[operatingsystem osfamily kernelrelease].each do |fact|
      Puppet.runtime[:facter].value(fact)
    end
  end
end

include Mocha::API
mocha_setup
