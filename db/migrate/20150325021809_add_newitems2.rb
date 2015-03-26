class AddNewitems2 < ActiveRecord::Migration
  def change
    add_column :userinputs, :machinetype, :string
  end
end
