Time::DATE_FORMATS[:news_without_time] = lambda{ |time| time.strftime("%B #{time.day.ordinalize} %Y") }
Time::DATE_FORMATS[:event_with_time] = lambda{ |time| time.strftime("%B #{time.day.ordinalize} %Y at %I:%M%p") }
Time::DATE_FORMATS[:index] = "%b %e/%Y %I:%M%p"
#Time::DATE_FORMATS[:form] = "%Y/%m/%d %I:%m %p"
Time::DATE_FORMATS[:form] = "%d/%m/%Y %I:%m %p"
