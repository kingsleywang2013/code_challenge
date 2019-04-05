class ChangeSeasonTypeToOffers < ActiveRecord::Migration[5.2]
  def up
    change_column :offers, :season, :integer
  end

  def down
    change_column :offers, :season, :decimal
  end
end
