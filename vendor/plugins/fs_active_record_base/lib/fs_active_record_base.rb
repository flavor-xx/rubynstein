module FsActiveRecordBase

  #KONSTANTEN

  #Recordstatusgroup
  RECORDSTATUSGROUP = 1
  #Recordstatus
  CLEAN    = 1
  INSERTED = 2
  UPDATED  = 3
  DELETED  = 4

  def before_validation
    self.status_group_id = RECORDSTATUSGROUP
    p "before_validation"
  end

  def before_validation_on_create
    self.status_id = INSERTED
    p "before_validation_on_create"
  end

  def before_validation_on_update
    self.status_id = UPDATED
    p "before_validation_on_update"
  end

  def before_create
    p "before_create"
  end

  def before_destroy
    self.status_id = DELETED
    p "before_destroy"
  end

  def before_update
    p "before_update"
  end

  def before_save
    p "before_save"
  end
end
