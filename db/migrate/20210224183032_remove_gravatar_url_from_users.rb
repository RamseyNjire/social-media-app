class RemoveGravatarUrlFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :gravatar_url, :string
  end
end
