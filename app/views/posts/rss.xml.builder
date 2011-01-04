xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title PAGE_TITLE
    xml.description PAGE_SUB_TITLE
    xml.link PAGE_URL

    for item in @items
      if item.is_a?(Post)
        xml.item do
          xml.title item.title
          xml.description simple_format(item.body)
          xml.pubDate item.created_at.to_s(:rfc822)
          xml.link "#{PAGE_URL}/news/#{item.permalink}"
        end
      elsif item.is_a?(Event)
        xml.item do
          xml.title item.title
          xml.description simple_format(item.starts_at.to_s(:event_with_time) + "\n\n" + item.description)
          xml.pubDate item.created_at.to_s(:rfc822)
          xml.link "#{PAGE_URL}/events/#{item.id}"
        end
      end
    end
  end
end

