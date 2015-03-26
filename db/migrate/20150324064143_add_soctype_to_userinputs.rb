class AddSoctypeToUserinputs < ActiveRecord::Migration
  def change
    add_column :userinputs, :soctype, :string
    add_column :userinputs, :machinetype, :string
  end
end
