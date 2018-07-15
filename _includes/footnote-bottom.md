{% if include.open==1 %}
<div id="note">
<b id="f{{include.num}}">{{include.num}}</b> 
{% else if include.open==0 %}
<a href="#a{{include.num}}">[↩]</a>
</div>
{% else %}
<div id="note">
<b id="f{{include.num}}">{{include.num}}</b> 
{{include.text}}
<a href="#a{{include.num}}">[↩]</a>
</div>

{% endif %}


