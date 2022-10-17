---
layout: home
---


{% for date in site.data.Eventos %}
<section class='date' data-date='{{ date[0] | date: "%Y-%m-%d" }}'>

<h3> {{ date[0] | date: '%d/%m/%Y' }} </h3>

<ol class='events'>
  {% for thing in date[1] %}
    <li> <a href='{{thing.url}}' target=_blank>{{ thing.name }}</a>: {{ thing.comienzo | date: '%H:%M' }}
      {% if thing.fin  %}
        - {{ thing.fin | date: '%H:%M'}} 
      {% endif %}
      <span class='where'>({{ thing.name_lugar  }})</span>
      <p class='description'>{{ thing.descripcion | newline_to_br  }}</p>
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
 // toggle short/long description
 for (let item of  document.getElementsByClassName("description")) {
    item.addEventListener("click", (event) => { event.target.classList.toggle("show")} )
 }
</script>
<style>
 .past {
  opacity: 30%
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
