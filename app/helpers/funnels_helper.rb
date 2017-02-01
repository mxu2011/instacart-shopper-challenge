module FunnelsHelper
  def week_range(week_begin)
    week_begin.strftime("%Y-%m-%d") +
    "-" +
    (week_begin + 6.days).strftime("%Y-%m-%d")
  end
end
