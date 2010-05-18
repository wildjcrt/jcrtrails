xml.instruct! 
xml.rss "version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
  xml.channel do
    xml.title 'Mini BGG'
    xml.link url_for(:only_path => false,
                     :controller=> 'forum',
                     :action=> 'index') 
    xml.description h("It's just for practice.") 
    @posts.each do |post|
      xml.item do 
        xml.title post.subject
        xml.link url_for(:only_path => false, 
                         :controller=> 'forum',
                         :action=> 'show', 
                         :id => post)
                         
        xml.guid url_for(:only_path => false,
                         :controller=> 'forum', 
                         :action=> 'show', 
                         :id => post)
      end 
    end
  end 
end