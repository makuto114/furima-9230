class RemoveColumnFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :user, :integer
  end
end
