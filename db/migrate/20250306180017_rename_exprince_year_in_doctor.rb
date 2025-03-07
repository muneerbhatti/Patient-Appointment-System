class RenameExprinceYearInDoctor < ActiveRecord::Migration[7.2]
  def change
    rename_column :doctors, :Exprince_year, :experience_year
  end
end
