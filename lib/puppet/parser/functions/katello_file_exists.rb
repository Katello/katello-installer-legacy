begin
  require '/usr/share/katello/lib/util/puppet.rb'
rescue LoadError
  fail "Katello was not installed on this host - configuration cannot continue"
end

module Puppet::Parser::Functions
  newfunction(:katello_file_exists, :type => :rvalue) do |args|
     return File.exists?(args[0])
  end
end
