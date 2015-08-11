module MessagesHelper

  def recipient_options
    s = ''
    Mentor.all.each do |mentor|
      s << "<option value='#{mentor.id}'>#{mentor.name}</option>"
    end
    s.html_safe
  end

end
