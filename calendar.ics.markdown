---
layout: empty
permalink: /calendar.ics
---
BEGIN:VCALENDAR
VERSION:2.0
PRODID:{{ site.url }}
METHOD:PUBLISH
{% for date in site.data.Eventos %}{% for thing in date[1] %}BEGIN:VEVENT
UID:{{ thing.id }}@example.com
ORGANIZER;CN="Organizer Name":MAILTO:organizer@example.org
LOCATION:{{ thing.name_lugar | join: ', ' | newline_to_br  }}
SUMMARY:{{ thing.name | newline_to_br }} {{ thing.description | newline_to_br }}
CLASS:PUBLIC
DTSTART:{{ thing.comienzo | date: "%Y%m%dT%H%M%SZ" }}
DTEND:{{ thing.fin | default: thing.comienzo | date: "%Y%m%dT%H%M%SZ" }}
DTSTAMP:{{ thing.comienzo | date: "%Y%m%dT%H%M%SZ" }}
END:VEVENT
{% endfor %}{%- endfor -%}
END:VCALENDAR
