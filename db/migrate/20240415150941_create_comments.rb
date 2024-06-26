# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :earthquake_event, foreign_key: true

      t.timestamps
    end
  end
end
