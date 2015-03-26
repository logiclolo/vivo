class AddNewitems8 < ActiveRecord::Migration
  def change
    add_column :userinputs, :image_c0_sensor_type, :string
    add_column :userinputs, :image_c0_backfocus, :integer
    add_column :userinputs, :image_c0_focusassist, :integer
    add_column :userinputs, :image_c0_remotefocus, :integer
    add_column :userinputs, :image_c0_eis, :integer
    add_column :userinputs, :image_c0_dnr, :integer
  end
end
