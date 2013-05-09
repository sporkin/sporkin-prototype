class AddPasswordIdentityInfo < ActiveRecord::Migration
  def up
    change_table :identities do |t|
      t.string :pwd_first_name
      t.string :pwd_last_name
      t.string :pwd_email
      t.string :pwd_encrypted_password,   :limit => 128
      t.string :pwd_password_salt
    end
  end

  def down
    change_table :identities do |t|
      t.remove :pwd_first_name
      t.remove :pwd_last_name
      t.remove :pwd_email
      t.remove :pwd_encrypted_password
      t.remove :pwd_password_salt
    end    
  end
end
