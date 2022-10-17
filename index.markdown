---
layout: home
---


{% for date in site.data.Eventos %}
<section class='date' data-date='{{ date[0] | date: "%Y-%m-%d" }}'>

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


<script>
 var list=document.getElementsByClassName("date")
 let today=new Date();
 today.setHours(0,0,0,0)
 for (let item of list) {
     item.className += " " + ((new Date(item.dataset.date) >= today) ? "future" : "past")
 }
</script>
<style>
 .past {
  opacity: 30%
 }
</style>
