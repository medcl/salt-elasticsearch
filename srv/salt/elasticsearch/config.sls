/usr/local/elasticsearch/config/elasticsearch.yml:
  file:
    - managed
    - source: salt://elasticsearch/files/config/elasticsearch.yml
    - template: jinja
    - context:
      CLUSTER_NAME: {{ pillar['es']['CLUSTER_NAME'] }}
      PATH_DATA: {{ pillar['es']['PATH_DATA'] }}
      PATH_LOGS: {{ pillar['es']['PATH_LOGS'] }}
    - user: root
    - group: root
    - mode: 644
    - makedirs: True

/usr/local/elasticsearch/bin/service/elasticsearch.conf:
  file:
    - managed
    - source: salt://elasticsearch/files/service/elasticsearch.conf
    - template: jinja
    - context:
      HEAP_SIZE: {{ pillar['es']['HEAP_SIZE'] }}
    - user: root
    - group: root
    - mode: 644
    - makedirs: True


