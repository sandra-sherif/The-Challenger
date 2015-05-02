class CreateChallengeResponses < ActiveRecord::Migration
  def change
    create_table :challenge_responses do |t|
      t.string :path

      t.timestamps
    end
  end
end
