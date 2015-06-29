---
layout: default
title: buy
---

<article class="row white">
  <div class="small-12 columns center-text">
        {% for about in site.data.about %}
	{% if about.amazon%}
	  <a href="{{ about.amazon }}"><span class="icon-amazon sales amazon"></span></a>
	{% endif %}
	{% if about.comixology %}
	  <a href="{{ about.comixology }}"><span class="icon-comixology sales comixology"></span></a>
	{% endif %}
		{% if about.gumroad%}
	  <a href="{{ about.gumroad }}"><span class="icon-gumroad sales gumroad"></span></a>
	{% endif %}
	{% if about.drivethru%}
	  <a href="{{ about.drivethru }}"><span class="icon-drivethru sales drivethru hide-for-small"></span></a>
	{% endif %}
      {% endfor %}
  </div>
  <div class="small-12 medium-4 columns center-text">
    <img src="/images/affl-3d.png">
  </div>
  <div class="small-12 medium-8 columns">
    <h1 class="center-text">Shamsee: A Fistful of Lunars</h1>
    <h2 class="center-text"><em>PUTTING THE 'DUMB' IN 'DUMB LUCK'.</em></h2>
    <p>Shamsee’s a small time thief short on common sense. When he crosses The Blighter, a powerful gangster, Shamsee finds himself in debt and in trouble. While calling upon his resources and stumbling across luck both good and bad, the criminal underworld threatens to come out from under him.</p>
    <p>Business associates, old flames and new flings all want something from Shamsee, and he’s willing to give: for the right price. Songs are sung, jobs are blown and blood is spilled in the quest for A FISTFUL OF LUNARS.</p>
    
    <p><em>125 comic book pages of unlucky rogues, conniving gangsters and an underworld full of big plans, bigger risks and bloody consequences.</em></p>
    <h3 class="center-text">CRIME. COMEDY. FANTASY.</h3>
  </div>
  <div class="small-12 columns center-text">
        {% for about in site.data.about %}
	{% if about.amazon%}
	  <a href="{{ about.amazon }}"><span class="icon-amazon sales amazon"></span></a>
	{% endif %}
	{% if about.comixology %}
	  <a href="{{ about.comixology }}"><span class="icon-comixology sales comixology"></span></a>
	{% endif %}
		{% if about.gumroad%}
	  <a href="{{ about.gumroad }}"><span class="icon-gumroad sales gumroad"></span></a>
	{% endif %}
	{% if about.drivethru%}
	  <a href="{{ about.drivethru }}"><span class="icon-drivethru sales drivethru hide-for-small"></span></a>
	{% endif %}
      {% endfor %}
  </div>
</article>
