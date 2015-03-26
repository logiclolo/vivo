class AddNewitems3 < ActiveRecord::Migration
  def change
    add_column :userinputs, :daynight_support, :integer
    add_column :userinputs, :daynight_builtinir, :integer
    add_column :userinputs, :daynight_externalir, :integer
    add_column :userinputs, :daynight_smartir, :integer
    add_column :userinputs, :daynight_ircutfilter, :integer
    add_column :userinputs, :daynight_lightsensor, :integer
  end
end
