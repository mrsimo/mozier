require 'mechanize'

class Mozier
  
  attr_accessor :username
  attr_accessor :password
  attr_accessor :agent
  attr_accessor :logged_in_page
  attr_accessor :info
  
  URLS = {:login => "https://mozy.com/login"}
  
  def initialize(username,password)
    @username = username
    @password = password
    @agent = Mechanize.new
  end
  
  def logged_in_page
    return @logged_in_page unless @logged_in_page.nil?
    page = @agent.get(URLS[:login])
    form = page.forms.last
    form.username = @username
    form.password = @password
    @logged_in_page = @agent.submit(form, form.buttons.first)
  end
  
  def info
    return @info unless @info.nil?
    @info = []
    logged_in_page.search("table#machines_box tr").each_with_index do |row,idx|
      if tds = row.css("td") and tds.size > 3
        @info[idx] ||= {}
        @info[idx] = { :name        => tds[0].text.strip,
                       :size        => tds[1].text.strip.to_size,
                       :last_backup => tds[2].text.strip.to_time }
      end
    end
    @info.compact!
  end
  
  def reload_info
    @info = nil
    @logged_in_page = nil
    info
  end
  
end