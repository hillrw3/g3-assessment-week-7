class VisitorComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.string :name
      t.string :message
    end
  end

  def down
    drop_table :users
  end
end
