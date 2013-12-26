# Get it
elasticsearch_0_90_2:
  file.managed:
    - name: /tmp/elasticsearch_0.90.2.tar.gz
    - source: http://192.168.56.104:8111/pkg/elasticsearch_0.90.2.tar.gz
    - unless: test -d /usr/local/elasticsearch/bin
    - source_hash: md5=539aef82312827eda1240782c91887db
# Extract it
extract-es:
  cmd:
    - cwd: /tmp
    - names:
      - tar xvf elasticsearch_0.90.2.tar.gz
    - unless: test -d /usr/local/elasticsearch/bin
    - run
    - require:
      - file: elasticsearch_0_90_2
# Configure it
configure-es:
  cmd:
    - cwd: /tmp/
    - names:
      - mv elasticsearch /usr/local/
    - run
    - unless: test -d /usr/local/elasticsearch/bin
    - require:
      - cmd: extract-es


# Configure it
service-install-es:
  cmd:
    - cwd: /tmp/
    - names:
      - /usr/local/elasticsearch/bin/service/elasticsearch install
    - run
    - unless: test -e /etc/init.d/elasticsearch
    - require:
      - cmd: configure-es

