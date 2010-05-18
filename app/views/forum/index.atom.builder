xml.instruct! :xml, :version=>"1.0" 
xml.feed(:xmlns => "http://www.w3.org/2005/Atom") do |feed|
  feed.title('Mini BGG RSS')
  feed.link('http://rails.s3p.org')
  for post in @posts do
    feed.entry do |entry|
      entry.id(post.id)
      entry.title( post.subject )
      entry.content( post.content + link_to("(更多詳細資訊...)", forum_path(post)), :type => 'html')
      entry.link(url_for(:controller => "forum", :action => 'show', :id => post.id))
    end
  end
end
