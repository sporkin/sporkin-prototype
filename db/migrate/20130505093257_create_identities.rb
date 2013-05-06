class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.integer :user_id
      t.string :type
      t.string :provider
      t.string :fb_access_token
      t.string :fb_id
      t.string :fb_email
      t.string :fb_first_name
      t.string :fb_last_name
      t.string :fb_url

      t.timestamps
    end
  end
end
