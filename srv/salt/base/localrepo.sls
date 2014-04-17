/etc/yum.repos.d/local.repo:
  file:
    - managed
    - source: salt://base/files/local.repo
    - template: jinja
    - context:
      local_yum_server: {{ pillar['YUM_SERVER'] }}
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
