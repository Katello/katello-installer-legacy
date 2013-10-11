module Puppet::Parser::Functions

  # returns either a value, or the string "null"
  # if the value is nil or "NONE"
  # optionally can wrap the value in quotes (unless nil/NONE)
  newfunction(:katello_null_string, :type => :rvalue) do |args|
    value = args[0]
    use_quotes = args[1]

    if value && value != "NONE"
     value = args[0]
     value = "\"#{value}\"" if use_quotes
    else
     value = "null"
    end

    value
  end

end
