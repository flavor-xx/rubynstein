require "fs_active_record_migration"

ActiveRecord::Migration.send(:extend, FsActiveRecordMigration)