#--
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#++

require 'fuse/stat'
require 'fuse/file_info'

module Fuse; class FileSystem

class Operations
	Callbacks = {
		getattr: -> block {
			-> path, buf {
				block.(path, Stat.new(buf))
			}
		},

		fgetattr: -> block {
			-> path, buf, fi {
				block.(path, Stat.new(buf), FileInfo.new(fi))
			}
		},

		release: -> block {
			-> path, fi {
				block.(path, FileInfo.new(fi))
			}
		},

		open: -> block {
			-> path, fi {
				block.(path, FileInfo.new(fi))
			}
		},

		read: -> block {
			-> path, buf, size, off, fi {
				block.(path, Buffer.new(buf, size, off), FileInfo.new(fi))
			}
		},

		rename:  true,
		unlink:  true,
		rmdir:   true,
		symlink: true,
		link:    true,
	}

	attr_reader :filesystem
	
	alias fs filesystem

	def initialize (filesystem)
		@filesystem = filesystem

		@blocks   = {}
		@internal = C::Operations.new
	end

	def to_ffi
		@internal.pointer
	end

	Callbacks.each {|name, factory|
		define_method name do |*args, &block|
			if block
				@blocks[name]   = block
				@internal[name] = Callbacks[name] == true ? block : Callbacks[name].(block)
			else
				@blocks[name].(*args)
			end
		end
	}
end

end; end
