jdk7:
  file.managed:
    - name: /tmp/jdk-7u15-linux-x64.gz
    - source: {{ pillar['FILE_SERVER'] }}/pkg/jdk-7u15-linux-x64.gz
    - unless: test -d /usr/local/jdk1.7.0/bin/
    - source_hash: md5=118a16aab9ff2c3f7c7788658cc77734

extract-java:
  cmd:
    - cwd: /tmp
    - names:
      - tar xvf jdk-7u15-linux-x64.gz
    - unless: test -d /usr/local/jdk1.7.0/bin/
    - run
    - require:
      - file: jdk7

configure-java:
  cmd:
    - cwd: /tmp/
    - names:
      - mv jdk1.7.0_15 /usr/local/jdk1.7.0
    - run
    - unless: test -d /usr/local/jdk1.7.0/bin/
    - require:
      - cmd: extract-java
 
setting-java:
  file.append:
    - name: /etc/profile
    - text: "export JAVA_HOME=/usr/local/jdk1.7.0/  \nexport CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar  \nexport PATH=$PATH:$JAVA_HOME/bin"
 
 
setting-bashrc-java:
  file.append:
    - name: /root/.bashrc
    - text: "export JAVA_HOME=/usr/local/jdk1.7.0/  \nexport CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar  \nexport PATH=$PATH:$JAVA_HOME/bin"

config_java_env:
  cmd:
   - names: 
     - . /etc/profile && . /root/.bashrc
     - alternatives --install /usr/bin/java java /usr/local/jdk1.7.0/bin/java 100
     - alternatives --install /usr/bin/jar jar /usr/local/jdk1.7.0/bin/jar 100
     - alternatives --install /usr/bin/javac javac /usr/local/jdk1.7.0/bin/javac 100 
   - run
   - unless: test -f /usr/bin/java
