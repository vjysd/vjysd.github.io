{% if include.exturl == "" %}
[[{{include.text}}]]({{ site.url }}{{ include.url }}){:target="_blank"}{:style="float: right;margin-right: 7px;margin-top: 7px;"}
{% else %}
[[{{include.text}}]]({{ include.exturl }}{{include.url}}){:target="_blank"}{:style="float: right;margin-right: 7px;margin-top: 7px;"}
{% endif %}
