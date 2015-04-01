class Additems27 < ActiveRecord::Migration
  def change
    add_column :userinputs, :nvideomode, :integer
  end
end
