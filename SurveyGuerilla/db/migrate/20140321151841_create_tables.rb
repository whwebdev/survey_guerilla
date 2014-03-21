class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :hashword
      t.string :email

      t.timestamps
    end

    create_table :surveys do |t|
      t.integer :creator_id
      t.string :title

      t.timestamps
    end

    create_table :questions do |t|
      t.belongs_to :survey
      t.string :text

      t.timestamps
    end

    create_table :answers do |t|
      t.belongs_to :question
      t.string :text

      t.timestamps
    end

    create_table :answers_users do |t|
      t.belongs_to :answer
      t.belongs_to :user

      t.timestamps
    end

    create_table :surveys_users do |t|
      t.belongs_to :survey
      t.belongs_to :user

      t.timestamps
    end
  end
end
