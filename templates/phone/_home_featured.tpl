<div class="span6">
    <div class="do_clickable thumbnail">
    	<a href="{{ pid.page_url }}"><img src="{% image_url pid.depiction|default:pid mediaclass="wow-home-featured" %}" alt="" /></a>
		<h2>{{ pid.title }}</h2>
	    <p>{{ pid.summary|default:pid.body|striptags|truncate:240 }} <a href="{{ pid.page_url }}">{_ Read more _} &raquo;</a></p>
	</div>
</div>