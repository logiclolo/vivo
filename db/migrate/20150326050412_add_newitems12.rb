class AddNewitems12 < ActiveRecord::Migration
  def change
    add_column :userinputs, :version_onvifdaemon, :string 
    add_column :userinputs, :version_onviftesttool, :string 
  end
end
