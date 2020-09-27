class AddSoldStatus < ActiveRecord::Migration[6.0]
  def change
    add_column :instruments, :sold, :boolean, default: false
  end
end
