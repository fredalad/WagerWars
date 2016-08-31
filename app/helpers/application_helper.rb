module ApplicationHelper
  def is_admin?(email)
    if email == "jonsnow@example.com"
      return true
    else
      return false
    end
  end
end
