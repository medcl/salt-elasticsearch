es-service-running:
  service:
    - running
    - name: elasticsearch
    - enable: True
    - watch:
      - file: /usr/local/elasticsearch/config/elasticsearch.yml
      - file: /usr/local/elasticsearch/bin/service/elasticsearch.conf
      - user: elasticsearch
