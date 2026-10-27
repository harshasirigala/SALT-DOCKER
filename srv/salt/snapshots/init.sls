nginx-package:
  pkg.installed:
    - name: nginx
    - refresh: True

snapshots-config:
  file.managed:
    - name: /etc/nginx/conf.d/snapshots.conf
    - source: salt://snapshots/nginx.conf.jinja
    - template: jinja
    - mode: '0600'
    - user: root
    - group: root
    - show_changes: False
    - require:
      - pkg: nginx-package

nginx-service:
  service.running:
    - name: nginx
    - enable: True
    - require:
      - pkg: nginx-package
    - watch:
      - file: snapshots-config
