class Diary < ActiveRecord::Base


  #年月検索
  def self.year_month(year,month)
    self.where(["year(authored_on) = ? and month(authored_on) = ?", year, month])
  end

  #年別の集計SQL
  def self.year_list
    self.select("year(authored_on) as year")
    .group("year(authored_on)")
    .order("authored_on desc")
  end

  #月別の集計SQL
  def self.monthly_list
    self.select("year(authored_on) as year","month(authored_on) as month")
    .group("year(authored_on)","month(authored_on)")
    .order("authored_on desc")
  end
end
