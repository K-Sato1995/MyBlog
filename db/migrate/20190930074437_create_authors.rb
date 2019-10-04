class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_digest
      t.timestamps
    end
  end
end