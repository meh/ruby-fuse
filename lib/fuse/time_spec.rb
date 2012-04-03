module Fuse

  class TimeSpec
    def initialize (pointer)
      @internal = pointer.is_a?(C::Stat) ? pointer : C::Stat.new(pointer)
    end

    C::Stat.layout.members.each {|name|
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
