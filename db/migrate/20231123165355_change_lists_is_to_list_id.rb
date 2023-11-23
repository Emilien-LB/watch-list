class ChangeListsIsToListId < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookmarks, :lists_id, :list_id
  end
end
