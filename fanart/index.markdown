---
layout: default
title: fanart
---

<article class="row">
  <h1>Fanart</h1>
    {% for fanart in site.data.fanart %}
    <div class="small-4 column text-center">
      <a href="{{ fanart.link }}">
	<figure>
	  <img src="{{ site.baseurl }}{{ fanart.image }}" class="center" alt="Fanart by {{ fanart.artist }}"/>
	  <figcaption class="center-text">Art by {{ fanart.artist }}</figcaption>
	</figure>
      </a>
    </div>
    {% endfor %}
</article>