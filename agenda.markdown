---
layout: home
---

<style>
body, html {
width: 300px;
height: 300px;
overflow: hidden;    
font-size: 90%;
background-color: #eee;
}

h1{
font-size: 110%;
font-weight:bold;
}

p.instr {
display: none;    
}

p.ical {
display: none;
}

ol.events li {
padding: 2px;
         margin-bottom: 6px;
         background-color: white;

  list-style-type: none;
}

ol.events{
  margin-left:10px;
}
a.name {
    font-weight: bold;
        color: black;
        }

p.description {
display: none;
}

header.site-header {
display: none;
}

h3.date {
    margin-bottom: 5px;
        font-weight: bold;
        }
.past {
display: none;
}
footer{
display: none;
}
</style>

<h1>@comerselargentina</h1>
{% for date in site.data.Eventos %}
<section class='date' data-date='{{ date[0] | date: "%Y-%m-%d" }}'>

<h3 class='date'> {{ date[0] | date: '%d/%m/%Y' }} </h3>

<ol class='events'>
  {% for thing in date[1] %}
    <li> <a href='{{thing.url}}' class='name' target=_blank>{{ thing.name }}</a>: {{ thing.comienzo | date: '%H:%M' }}
      {% if thing.fin  %}
        - {{ thing.fin | date: '%H:%M'}} 
      {% endif %}
      <span class='where'>{{ thing.name_lugar  }}</span>
      <p class='description'>{{ thing.descripcion | newline_to_br  }}</p>
    </li>
  {% endfor %}
</ol>
</section>
{% endfor %}

{% include format_agenda.html %}
