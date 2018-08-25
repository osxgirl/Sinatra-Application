class Service < ActiveRecord::Migration
    
    def change
        create_table :service do |t|
            t.string :content
        end
    end
    
end
