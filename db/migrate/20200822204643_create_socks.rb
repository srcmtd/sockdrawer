class CreateSocks < ActiveRecord::Migration[6.0]
  def change
    create_table :socks, id: :uuid do |t|
      t.string :code_name
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :birthday
      t.text :interests
      t.text :skills
      t.text :languages
      t.string :operating_system
      t.string :mobile_device
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
