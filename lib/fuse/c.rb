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

module Fuse

module C
  extend FFI::Library

  ffi_lib 'fuse'
end

end

require 'sensors/c/types'
require 'sensors/c/functions'
