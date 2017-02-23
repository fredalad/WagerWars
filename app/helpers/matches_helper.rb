module MatchesHelper
  # For Date_Time
  # date = [0]
  # time = [1]
  # zone offset = [2]

  # For Date
  # year = [0]
  # month = [1]
  # day = [2]

  # For Time
  # Hour = [0]
  # Minute = [1]
  # Second = [2]

  def parse_time(date_time, zone)

     return date_time.strftime("%-d %b %Y, %I:%M %p %Z")

    #parse_date_time = date_time.split(' ')
    #date = parse_date_time[0].split('-')
    #time = parse_date_time[1].split(':')
    #month = find_month(date[1].to_i)
    #return month + " " + date[2]

  end
  def find_month(month)
    case month
    when 1
      return "Jan"
    when 2
      return "Feb"
    when 3
      return "Mar"
    when 4
      return "Apr"
    when 5
      return "May"
    when 6
      return "Jun"
    when 7
      return "Jul"
    when 8
      return "Aug"
    when 9
      return "Sep"
    when 10
      return "Oct"
    when 11
      return "Nov"
    when 12
      return "Dec"
    else
      return "Invalid Date"
    end
  end

end
