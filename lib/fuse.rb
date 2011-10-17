#--
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#++

require 'fuse/c'
require 'fuse/arguments'
require 'fuse/file_system'

module Fuse
	def start (args = [], &block)
		C::fuse_main_real(*Arguments.new(args).to_ffi, *FileSystem.new(&block).operations.to_ffi)
	end
end
