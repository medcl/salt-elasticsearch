{% for user,uid in pillar.get('users',{}).items() %}
{{user}}:
  user.present:
    - uid: {{uid}}
{% endfor %}
