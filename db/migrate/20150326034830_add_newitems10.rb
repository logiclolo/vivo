class AddNewitems10 < ActiveRecord::Migration
  def change
    add_column :userinputs, :thermal_support, :integer
    add_column :userinputs, :thermal_temperaturedetection, :integer 
  end
end
