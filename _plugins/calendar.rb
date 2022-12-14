require 'icalendar'
module CalendarPlugin
  class CalendarPageGenerator < Jekyll::Generator
    safe true
    priority :lowest
    def generate(site)
			@site = site
      site.pages << make_page("calendar.ics", icalendar)
    end

    def icalendar
			cal = Icalendar::Calendar.new()
      cal.append_custom_property("X-WR-CALNAME",@site.config["title"])
      cal.append_custom_property("REFRESH-INTERVAL;VALUE=DURATION","DURATION:PT12H")
      cal.append_custom_property("X-PUBLISHED-TTL","PT12H")
      cal.append_custom_property("NAME",@site.config["title"])
      cal.append_custom_property("DESCRIPTION",@site.config["description"])
      cal.timezone do |t|
          t.tzid = "America/Buenos_Aires"
      end
      @site.data["Eventos"].each do |date|
        date[1].each do |thing|
          cal.event do |e|
            e.dtstart     = Icalendar::Values::DateTime.new thing["comienzo"], tzid: "America/Buenos_Aires"
            e.dtend       = Icalendar::Values::DateTime.new thing["fin"], tzid: "America/Buenos_Aires"
            e.summary     = thing["name"]
            e.description = thing["url"].to_s + "\n" + thing["descripcion"].to_s
            e.ip_class    = "PUBLIC"
            e.url = thing["url"]
            e.location = "#{Array(thing["name_lugar"]).join(" ")}, #{Array(thing["calle_y_numero"]).join(" ")}"
            e.organizer = thing["name_organizador"]
            e.uid = thing["id"]
          end
        end
      end

			cal.to_ical
    end

    def make_page(file_path, content)
      PageWithoutAFile.new(@site, __dir__, "", file_path).tap do |file|
        file.content = content
        file.data.merge!(
          "layout"     => nil,
          "sitemap"    => false,

        )
        file.output
      end
    end
		class PageWithoutAFile < Jekyll::Page
			def read_yaml(*)
				@data ||= {}
			end
		end
  end
end
