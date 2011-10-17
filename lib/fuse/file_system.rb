#--
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#++

module Fuse

class FileSystem
	extend Forwardable

	attr_reader    :operations
	def_delegators :@operations, *Operations::Callbacks.keys

	def initialize (&block)
		@operations = Operations.new(self)

		instance_eval block
	end
end

end
