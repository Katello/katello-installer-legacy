module Puppet::Parser::Functions
  # escape the username for pulp
  newfunction(:katello_escape_pulp_login, :type => :rvalue) do |args|
    args[0].gsub(/[^A-Za-z0-9_-]/, "_")
  end
end
