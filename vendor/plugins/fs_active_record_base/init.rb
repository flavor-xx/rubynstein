require "fs_active_record_base"

ActiveRecord::Base.send(:include, FsActiveRecordBase)
