class CreateExternalUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :external_users do |t|
      t.references :user, null: false
      t.string :uid, null: false
      t.string :provider, null: false
      t.string :crypted_token
      t.string :crypted_secret
      t.timestamps

      t.index [:uid, :provider], unique: true
    end
  end
end
