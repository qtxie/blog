{% if theme.widget.Tags %}
    <section id="tags" class="widget-area widget_tags">
        <h3 class="widget-title">标签</h3>
        {{ list_tags({show_count: true, amount: 10, orderby: 'count'}) }}
    </section>
{% endif %}
