class AddAgeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer, :only_integer => true, :must_be_less_than_or_equal_to => 100
    # validates :age => numericality: { :only_integer, must_be_less_than_or_equal = 100}
    # if age > 199
    # errors.add(:age, "can't be string or greater than 99") 
# end
  end
end
