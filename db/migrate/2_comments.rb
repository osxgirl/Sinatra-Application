class Comments < ActiveRecord::Migration
    
    def change
        create_table :comments do |t|
            t.string :content
            t.string :device
            t.integer :user_id
        end
    end
    
end
