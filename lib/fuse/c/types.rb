#--
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#++

module Fuse; module C

callback :factory, [:pointer, :pointer], :pointer

callback :fuse_fill_dir_t, [:pointer, :string, :pointer, :off_t], :int
callback :fuse_dirfil_t, [:pointer, :string, :int, :ino_t], :int

callback :getattr, [:string, :pointer], :int
callback :readlink, [:string, :pointer, :size_t], :int
callback :getdir, [:string, :pointer, :fuse_dirfil_t], :int
callback :mknod, [:string, :mode_t, :dev_t], :int
callback :mkdir, [:string, :mode_t], :int
callback :unlink, [:string], :int
callback :rmdir, [:string], :int
callback :symlink, [:string, :string], :int
callback :rename, [:string, :string], :int
callback :link, [:string, :string], :int
callback :chmod, [:string, :mode_t], :int
callback :chown, [:string, :uid_t, :gid_t], :int
callback :truncate, [:string, :off_t], :int
callback :utime, [:string, :pointer], :int
callback :open, [:string, :pointer], :int
callback :read, [:string, :pointer, :size_t, :off_t, :pointer], :int
callback :write, [:string, :string, :size_t, :off_t, :pointer], :int
callback :statfs, [:string, :pointer], :int
callback :flush, [:string, :pointer], :int
callback :release, [:string, :pointer], :int
callback :fsync, [:string, :int, :pointer], :int
callback :setxattr, [:string, :string, :string, :size_t, :int], :int
callback :getxattr, [:string, :string, :pointer, :size_t], :int
callback :listxattr, [:string, :pointer, :size_t], :int
callback :removexattr, [:string, :string], :int
callback :opendir, [:string, :pointer], :int
callback :readdir, [:string, :pointer, :fuse_fill_dir_t, :off_t, :pointer], :int
callback :releasedir, [:string, :pointer], :int
callback :fsyncdir, [:string, :int, :pointer], :int
callback :init, [:pointer], :pointer
callback :destroy, [:pointer], :void
callback :access, [:string, :int], :int
callback :create, [:string, :mode_t, :pointer], :int
callback :ftruncate, [:strig, :off_t, :pointer], :int
callback :fgetattr, [:string, :pointer, :pointer], :int
callback :lock, [:string, :pointer, :int, :pointer], :int
callback :utimens, [:string, :pointer], :int
callback :bmap, [:string, :size_t, :pointer], :int
callback :ioctl, [:string, :int, :pointer, :pointer, :uint, :pointer], :int
callback :poll, [:string, :pointer, :pointer, :pointer], :int

class Operations < FFI::Struct
	layout \
		:getattr,      :getattr,
		:readlink,     :readlink,
		:getdir,       :getdir,
		:mknod,        :mknod,
		:mkdir,        :mkdir,
		:unlink,       :unlink,
		:rmdir,        :rmdir,
		:symlink,      :symlink,
		:rename,       :rename,
		:link,         :link,
		:chmod,        :chmod,
		:chown,        :chown,
		:truncate,     :truncate,
		:utime,        :utime,
		:open,         :open,
		:read,         :read,
		:write,        :write,
		:statfs,       :statfs,
		:flush,        :flush,
		:release,      :release,
		:fsync,        :fsync,
		:setxattr,     :setxattr,
		:getxattr,     :getxattr,
		:listxattr,    :listxattr,
		:removexattr,  :removexattr,
		:opendir,      :opendir,
		:readdir,      :readdir,
		:releasedir,   :releasedir,
		:fsyncdir,     :fsyncdir,
		:init,         :init,
		:destroy,      :destroy,
		:access,       :access,
		:create,       :create,
		:ftruncate,    :ftruncate,
		:fgetattr,     :fgetattr,
		:lock,         :lock,
		:utimens,      :utimens,
		:bmap,         :bmp,
		:flags,        :uint,
		:ioctl,        :ioctl,
		:poll,         :poll
end

class Context < FFI::Struct
	layout \
		:fuse,          :pointer,
		:uid,           :uid_t,
		:gid,           :gid_t,
		:pid,           :pid_t,
		:private_data,  :pointer,
		:umask,         :mode_t
end

class FileInfo < FFI::Struct
	layout \
		:flags,       :int,
		:fh_old,      :ulong,
		:writepage,   :int,
		:fuse_flags,  :uint,
		:fh,          :uint64,
		:lock_owner,  :uint64
end

class ConnInfo < FFI::Struct
	layout \
		:proto_major,    :uint,
		:proto_minor,    :uint,
		:async_read,     :uint,
		:max_write,      :uint,
		:max_readahead,  :uint,
		:capable,        :uint,
		:want,           :uint,
		:reserved,       [:uint, 25]
end

class Module < FFI::Struct
	layout \
		:name,     :string,
		:factory,  :factory,
		:next,     :pointer,
		:so,       :pointer,
		:ctr,      :int
end

class Stat < FFI::Struct
	layout \
		:st_dev,      :dev_t,
		:st_ino,      :ino_t,
		:st_mode,     :mode_t,
		:st_nlink,    :nlink_t,
		:st_uid,      :uid_t,
		:st_gid,      :gid_t,
		:st_rdev,     :dev_t,
		:st_size,     :off_t,
		:st_atime,    :time_t,
		:st_mtime,    :time_t,
		:st_ctime,    :time_t,
		:st_blksize,  :blksize_t,
		:st_blocks,   :blkcnt_t,
		:st_attr,     :mode_t
end

end; end
