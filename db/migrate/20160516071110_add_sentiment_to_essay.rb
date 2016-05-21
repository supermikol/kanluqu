class AddSentimentToEssay < ActiveRecord::Migration
  def change
    add_column :essays, :sentiment, :float
  end
end
