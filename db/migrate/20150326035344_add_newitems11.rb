class AddNewitems11 < ActiveRecord::Migration
  def change
        add_column :userinputs, :localstorage_manageable, :integer 
        add_column :userinputs, :localstorage_seamless, :integer 
        add_column :userinputs, :localstorage_modnum, :integer 
        add_column :userinputs, :localstorage_modversion, :string 
        add_column :userinputs, :localstorage_slconnum, :integer 
        add_column :userinputs, :localstorage_stormgrversio, :string 
        add_column :userinputs, :localstorage_supportedge, :integer 
  end
end
