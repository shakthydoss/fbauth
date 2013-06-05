class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :fbid
      t.string :fburl
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :profile_img
      t.string :description
      t.string :gender
      t.string :locale
      t.string :timezone

      t.timestamps
    end
  end
end
