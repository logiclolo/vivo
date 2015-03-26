class AddNewitems7 < ActiveRecord::Migration
  def change
    add_column :userinputs, :smartstream_support, :integer
    add_column :userinputs, :smartstream_nstream, :integer
    add_column :userinputs, :smartstream_mode_autotracking, :integer
    add_column :userinputs, :smartstream_nwindow_autotracking, :integer
    add_column :userinputs, :smartstream_mode_manual, :integer
    add_column :userinputs, :smartstream_nwindow_manual, :integer
    add_column :userinputs, :smartstream_mode_hybrid, :integer
    add_column :userinputs, :smartstream_nwindow_hybrid_autotracking, :integer
    add_column :userinputs, :smartstream_nwindow_hybrid_manual, :integer
  end
end
