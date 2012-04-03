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

  class FileInfo
    def initialize (pointer)
      @internal = pointer.is_a?(C::FileInfo) ? pointer : C::FileInfo.new(pointer)
    end

    C::FileInfo.layout.members.each {|name|
      define_method name do
        @internal[name]
      end

      define_method "#{name}=" do |value|
        @internal[name] = value
      end
    }

    def to_ffi
      @internal.pointer
    end
  end

end

