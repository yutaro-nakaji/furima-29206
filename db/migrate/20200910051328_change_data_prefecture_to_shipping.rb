class ChangeDataPrefectureToShipping < ActiveRecord::Migration[6.0]
  def change
    change_column :shippings, :prefecture, :integer
  end
end
