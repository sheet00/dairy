rss = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
  xml.rss(:version => 2.0){
    xml.channel{
      #header
      xml.title request.host + " - RSS"
      xml.link "http://" + request.host
      xml.description "最近の10件"

      #item
      @diaries.each do |item|
        xml.item{
          xml.title item.title
          xml.link url_for(:host => request.host, :controller => :diaries, :action => :show, :id => item.id)
          xml.description get_description(item.body)
          xml.pubDate item.authored_on
        }
      end
    }
  }
end

rss.to_xml