---
layout: empty
permalink: /calendar.ics
---
BEGIN:VCALENDAR
VERSION:2.0
PRODID:{{ site.url }}
METHOD:PUBLISH
URL:{% link calendar.ics.markdown  %}
NAME:{{ site.title }}
X-WR-CALNAME:{{ site.title }}
DESCRIPTION:{{ site.description | newline_to_br }}
X-WR-CALDESC:{{ site.description | newline_to_br }}
{% for date in site.data.Eventos %}{% for thing in date[1] %}BEGIN:VEVENT
UID:{{ thing.id }}@example.com
ORGANIZER;CN="{{thing.name_organizador}}"
LOCATION:{{ thing.name_lugar | join: ', ' | newline_to_br  }}
URL:{{ thing.url }}
CLASS:PUBLIC
DTSTART:{{ thing.comienzo | date: "%Y%m%dT%H%M%SZ" }}
DTEND:{{ thing.fin | default: thing.comienzo | date: "%Y%m%dT%H%M%SZ" }}
DTSTAMP:{{ thing.comienzo | date: "%Y%m%dT%H%M%SZ" }}
END:VEVENT
{% endfor %}{%- endfor -%}
END:VCALENDAR
