class CreateDiaryCounts < ActiveRecord::Migration
  def self.up
    execute <<-SQL
    CREATE VIEW diary_counts AS
    select year(authored_on) as year, month(authored_on) as month, count(*) as monthly_count from diaries
    group by year(authored_on),month(authored_on)
    SQL
  end

  def self.down
    execute <<-SQL
    DROP VIEW diary_counts
    SQL
  end
end
