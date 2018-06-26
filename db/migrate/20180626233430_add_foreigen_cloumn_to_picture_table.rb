class AddForeigenCloumnToPictureTable < ActiveRecord::Migration[5.0]
  def up
      add_column :pictures, :user_id, :integer
  end
    def down
      remove_column :pictures, :user_id
    end
end
