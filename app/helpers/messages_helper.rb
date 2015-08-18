module MessagesHelper

  def recipient_options(chosen_recipient = nil)
    s = ''
    if mentee_signed_in?
      Mentor.all.each do |mentor|
        s << "<option value='#{mentor.id}'>#{mentor.name}</option>"
      end
    else
      Mentee.all.each do |mentee|
        s << "<option value='#{mentee.id}'>#{mentee.name}</option>"
      end
    end
    s.html_safe
  end

end
