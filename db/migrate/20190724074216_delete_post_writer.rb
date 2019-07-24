class DeletePostWriter < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :writer
  end
end
