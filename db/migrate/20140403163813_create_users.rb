class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name,
                :last_name,
                :city,
                :state,
                :avatar_url,
                :email,
                :password_digest
      t.boolean :admin

    end
  end
end
