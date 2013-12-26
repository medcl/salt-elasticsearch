/usr/local/elasticsearch/config/elasticsearch.yml:
  file:
    - managed
    - source: salt://elasticsearch/files/config/elasticsearch.yml
    - user: root
    - group: root
    - mode: 644
    - makedirs: True

/usr/local/elasticsearch/bin/service/elasticsearch.conf:
  file:
    - managed
    - source: salt://elasticsearch/files/service/elasticsearch.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: True


