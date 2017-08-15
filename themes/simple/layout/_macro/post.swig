{% macro render(post) %}
  <article class="post">
    <header class="post-header">
      <h1 class="post-title">
        {% if is_home() %}
          <a class="post-link" href="{{ url_for(post.path) }}">{{ post.title }}</a>
        {% else %}
          {{ post.title }}
        {% endif %}
      </h1>

      <time class="post-time">
          {{ full_date(post.date, 'YYYY-MM-DD') }}
      </time>
    </header>



    {% if is_home() %}
        <div class="post-excerpt">
            {% set excerpt = "" %}
        {% if post.description %}
			{% set excerpt = '<p>' + post.description + '</p>' %}
            {% elif post.excerpt %}
              {% set excerpt = post.excerpt %}
            {% endif %}

            {% if excerpt %}
              {{ excerpt }}
             <div class="read-more">
            <a href="{{ url_for(post.path) }}" class="read-more-link">{{ __('posts.readmore') }}</a>
			</div>
        </div>
            {% endif %}
          {% else %}
            <div class="post-content">
            {{ post.content }}
            </div>
          {% endif %}

    {% if not is_home() %}
      {# Post Copyright #}
      {% include "../_partial/_post/copyright.swig" %}

      {# Reward #}
      {% include "../_partial/_post/reward.swig" %}
	{% endif %}

    {% if post.tags and post.tags.length and not is_home() %}
      <footer class="post-footer">
        <div class="post-tags">
          {% for tag in post.tags %}
            <a href="{{ url_for(tag.path) }}">{{ tag.name }}</a>
          {% endfor %}
        </div>

        {# Post Pagination #}
        {% include "../_partial/pagination.swig" %}
        {% include "../_partial/comments.swig" %}
      </footer>
    {% endif %}
  </article>
{% endmacro %}
