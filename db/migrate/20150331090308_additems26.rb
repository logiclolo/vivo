class Additems26 < ActiveRecord::Migration
  def change
    remove_column :userinputs, :nvideomode, :string
    remove_column :userinputs, :nvideomode, :integer
  end
end
