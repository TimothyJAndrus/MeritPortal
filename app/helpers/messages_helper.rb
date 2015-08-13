module MessagesHelper

  def recipient_options(chosen_recipient = nil)
    s = ''
    Mentor.all.each do |mentor|
      s << "<option value='#{mentor.id}'>#{mentor.name}</option>"
    end
    s.html_safe
  end

end
