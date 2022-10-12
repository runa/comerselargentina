---
layout: home
---


{% for date in site.data.Eventos %}
<section data-date='{{ date[0] | date: "%Y-%jT%RZ" }}'>

<h3> {{ date[0] | date: '%d/%m/%Y' }} </h3>

<ol>
  {% for thing in date[1] %}
    <li> <a href='{{thing.url}}' target=_blank>{{ thing.name }}</a>: {{ thing.comienzo | date: '%H:%M' }}
      {% if thing.fin  %}
        - {{ thing.fin | date: '%H:%M'}} 
      {% endif %}
    </li>
  {% endfor %}
</ol>
</section>
{% endfor %}


