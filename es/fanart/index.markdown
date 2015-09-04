---
layout: default
title: fanart
language: es
---

<article class="row">
  <h1>Fanart</h1>
    {% for fanart in site.data.fanart %}
    <div class="small-4 column text-center">
      <a href="{{ fanart.link }}">
	<figure>
	  <img src="{{ site.baseurl }}{{ fanart.image }}" class="center" alt="ilustración de {{ fanart.artist }}"/>
	  <figcaption class="center-text">Ilustración de {{ fanart.artist }}</figcaption>
	</figure>
      </a>
    </div>
    {% endfor %}
</article>