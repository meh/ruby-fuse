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
extend FFI::Library
ffi_lib '/usr/local/lib/osxfuse/libosxfuse.dylib'
attach_function :fuse_new, [:pointer, :pointer, :pointer, :size_t, :pointer], :pointer
attach_function :fuse_destroy, [:pointer], :void
attach_function :fuse_loop, [:pointer], :int
attach_function :fuse_exit, [:pointer], :void
attach_function :fuse_loop_mt, [:pointer], :int
attach_function :fuse_get_context, [:void], :pointer
# attach_function :fuse_getgroups, [:int, :pointer], :int
attach_function :fuse_main_real, [:int, :pointer, :pointer, :size_t, :pointer], :int
# attach_function :fuse_notify_poll, [:pointer], :int
attach_function :fuse_fs_new, [:pointer, :size_t, :pointer], :pointer
attach_function :fuse_register_module, [:pointer], :void

attach_function :fuse_fs_getattr, [:pointer, :string, :pointer], :int
attach_function :fuse_fs_fgetattr, [:pointer, :string, :pointer, :pointer], :int
attach_function :fuse_fs_rename, [:pointer, :string, :string], :int
attach_function :fuse_fs_unlink, [:pointer, :string], :int
attach_function :fuse_fs_rmdir, [:pointer, :string], :int
attach_function :fuse_fs_symlink, [:pointer, :string, :string], :int
attach_function :fuse_fs_link, [:pointer, :string, :string], :int
attach_function :fuse_fs_release, [:pointer, :string, :pointer], :int
attach_function :fuse_fs_open, [:pointer, :string, :pointer], :int
attach_function :fuse_fs_read, [:pointer, :string, :buffer_out, :size_t, :off_t, :pointer], :int
attach_function :fuse_fs_write, [:pointer, :string, :buffer_in, :size_t, :off_t, :pointer], :int
attach_function :fuse_fs_fsync, [:pointer, :string, :int, :pointer], :int
attach_function :fuse_fs_flush, [:pointer, :string, :pointer], :int
attach_function :fuse_fs_statfs, [:pointer, :string, :pointer], :int
attach_function :fuse_fs_opendir, [:pointer, :string, :pointer], :int
callback :fuse_fill_dir, [:pointer, :pointer, :pointer, :off_t], :int
attach_function :fuse_fs_readdir, [:pointer, :string, :pointer, :fuse_fill_dir, :off_t], :int
attach_function :fuse_fs_fsyncdir, [:pointer, :string, :int, :pointer], :int
attach_function :fuse_fs_releasedir, [:pointer, :string, :pointer], :int
attach_function :fuse_fs_create, [:pointer, :string, :mode_t, :pointer], :int
attach_function :fuse_fs_lock, [:pointer, :string, :pointer, :int, :pointer], :int
attach_function :fuse_fs_chmod, [:pointer, :string, :mode_t], :int
attach_function :fuse_fs_chown, [:pointer, :string, :uid_t, :gid_t], :int
attach_function :fuse_fs_truncate, [:pointer, :string, :off_t], :int
attach_function :fuse_fs_ftruncate, [:pointer, :string, :off_t, :pointer], :int
attach_function :fuse_fs_utimens, [:pointer, :string, :pointer], :int
attach_function :fuse_fs_access, [:pointer, :string, :int], :int
attach_function :fuse_fs_readlink, [:pointer, :string, :pointer, :size_t], :int
attach_function :fuse_fs_mknod, [:pointer, :string, :mode_t, :dev_t], :int
attach_function :fuse_fs_mkdir, [:pointer, :string, :mode_t], :int
attach_function :fuse_fs_setxattr, [:pointer, :string, :string, :string, :size_t, :int], :int
attach_function :fuse_fs_getxattr, [:pointer, :string, :string, :pointer, :size_t], :int
attach_function :fuse_fs_listxattr, [:pointer, :string, :pointer, :size_t], :int
attach_function :fuse_fs_removexattr, [:pointer, :string, :string], :int
attach_function :fuse_fs_bmap, [:pointer, :string, :size_t, :pointer], :int
# attach_function :fuse_fs_ioctl, [:pointer, :string, :int, :pointer, :uint, :pointer], :int
# attach_function :fuse_fs_poll, [:pointer, :string, :pointer, :pointer, :pointer], :int
attach_function :fuse_fs_init, [:pointer, :pointer], :void
attach_function :fuse_fs_destroy, [:pointer], :void

end; end
