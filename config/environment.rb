# Load the Rails application.
require_relative 'application'

String.define_method(:truncate_to) do |n|
	self.length > n + 3 ? self[0...n] + '...'.freeze : self
end

String.define_method(:valid_colour?) do
	c = dup
	len = c.length

	return false if len > 7 || len < 3

	c[0] = ''.freeze if c.start_with?(?#.freeze)

	c.upcase!
	return false if c[/[^0-9A-F]/]

	len = c.length
	len == 3 || len == 6
end

String.define_method(:validate_colour) do |default_colour = 'fff'|
	valid_colour? ? self : default_colour
end

# Initialize the Rails application.
Rails.application.initialize!
