class AddImportidToVivocameras < ActiveRecord::Migration
  def change
    add_column :vivocameras, :importid, :integer
  end
end
