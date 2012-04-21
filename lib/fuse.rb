#--
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#++

require 'ffi'
require 'ffi/extra'

require 'fuse/c'
require 'fuse/c/functions'
require 'fuse/arguments'
require 'fuse/file_system'

module Fuse
  def start( args = [], &block )
    argc = 1

    argv_strings = []
    argv_strings << FFI::MemoryPointer.from_string("fuse.rb")
    argv_strings << FFI::MemoryPointer.from_string("-f")
    argv_strings << FFI::MemoryPointer.from_string("-s")

    mountpoint = args.shift
    if mountpoint
      argv_strings << FFI::MemoryPointer.from_string(mountpoint)
    end

    argv_strings << nil

    # Now load all the pointers into a native memory block
    argv = FFI::MemoryPointer.new(:pointer, argv_strings.length)
    argv_strings.each_with_index do |p, i|
      argv[i].put_pointer(0,  p)
    end
    argc = argv_strings.length - 1

    fs = FileSystem.new &block

    C::fuse_main_real(
      argc,
      argv,
      fs.operations.to_ffi,
      fs.operations.to_ffi.size,
      nil)
  end
end
