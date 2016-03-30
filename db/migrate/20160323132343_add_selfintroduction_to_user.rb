class AddSelfintroductionToUser < ActiveRecord::Migration
  def change
    add_column :users, :selfintroduction, :text
  end
end
