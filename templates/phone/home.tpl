{% extends "base.tpl" %}

{# phone #}

{% block page_class %}{% inherit %} home{% endblock %}
{% block title %}{{ m.rsc.page_home.subtitle|default:_"Welcome" }}{% endblock %}

{% block content %}
{% with m.rsc.page_home.id as id %}
<h1>{{ m.config.site.title.value }}</h1>

{% with id.o.hasfeatured as ps %}
{% if ps %}
	<div class="row-fluid featured">
		{% include "_home_featured.tpl" pid=ps[1] %}
		{% include "_home_featured.tpl" pid=ps[2] %}
	</div>
{% else %}
	<div class="alert alert-block">
	  <h4 class="alert-heading">Warning!</h4>
	  Please add <i>Featured</i> connections to the <i>page_home</i> 
	  {% if id.is_editable %}<a class="btn btn-mini pull-right" href="{% url admin_edit_rsc id=id %}">Edit</a>{% endif %}
	</div>
{% endif %}

<div class="row-fluid"> 
	{% with ps|nthtail:3 as ps_extra %}
	{% if ps_extra %}
		<div class="span6">
			{% include "_content_list.tpl" list=ps_extra %}
		</div><!-- /span -->
		<div class="span6">
			{% include "_content_list.tpl" list=id.o.haspart in_collection=id %}
		</div><!-- /span -->
	{% else %}
		{% with id.o.haspart|split_in:2 as ps %}
		<div class="span6">
			{% include "_content_list.tpl" list=ps[1] in_collection=id %}
		</div><!-- /span -->
		<div class="span6">
			{% include "_content_list.tpl" list=ps[2] in_collection=id %}
		</div><!-- /span -->
		{% endwith %}
	{% endif %}
	{% endwith %}
</div><!-- /row -->

{% if id.is_editable %}
<div class="row-fluid">
    <p><br/><a class="btn btn-mini pull-right" href="{% url admin_edit_rsc id=id %}">{_ Edit home page _}</a></p>
</div>
{% endif %}
{% endwith %}
{% endwith %}
{% endblock %}


