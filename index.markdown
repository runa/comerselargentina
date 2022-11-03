---
layout: home
---

<p class='instr'>➕Agregar eventos a la agenda: envialos o mencioná a <a href='https://www.instagram.com/comerselargentina/' target=_blank>@comerselargentina</a></p>
<p class='ical'>📅 Para tener los eventos en tu calendario, <a href='{% link calendar.ics  %}'>click acá</a></p>

{% for date in site.data.Eventos %}
<section class='date' data-date='{{ date[0] | date: "%Y-%m-%d" }}'>

<h3> {{ date[0] | localize: '%A %d/%m' | capitalize }} </h3>

<ol class='events'>
  {% for thing in date[1] %}
    <li> <a href='{{thing.url}}' target=_blank>{{ thing.name }}</a>: {{ thing.comienzo | date: '%H:%M' }}
      {% if thing.fin  %}
        - {{ thing.fin | date: '%H:%M'}} 
      {% endif %}
      <span class='where'>({{ thing.name_lugar  }})
      </span>
      <p class='description'>
        <small>📍{% if thing.ubicacion and thing.ubicacion != '' %}<a href='{{ thing.ubicacion }}' target='_blank'>{% endif %}
        {{ thing.calle_y_numero }}<br>
        {% if thing.ubicacion and thing.ubicacion != ''  %}</a>{% endif %}</small>
        {{ thing.descripcion | newline_to_br  }}
      </p>
    </li>
  {% endfor %}
</ol>
</section>
{% endfor %}


{% include format_agenda.html %}
<style>
.past {
  display:none;
  
 }
.far_future {
  opacity: 70%;
 }
.far_future ol {
}

section.date ol.events {
  margin-left: 0px;
}
section.date ol.events li{
  list-style-type: none;
}

p.description {
  height: 2em
  text-overflow: ellipsis;
  overflow: hidden;
  display: -webkit-box;
  -webkit-line-clamp: 1; /* number of lines to show */
  line-clamp: 1; 
  -webkit-box-orient: vertical;
}
p.description.show {
  overflow: auto;
  display: -webkit-box;
  -webkit-line-clamp: unset; /* number of lines to show */
  line-clamp: unset; 
  -webkit-box-orient: vertical;
}
</style>
