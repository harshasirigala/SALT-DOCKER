hello-binary:
  file.managed:
    - name: /usr/local/bin/hello-svc
    - source: salt://hello/files/hello-svc
    - mode: '0755'

hello-env:
  file.managed:
    - name: /etc/default/hello-svc
    - source: salt://hello/hello-svc.env.jinja
    - template: jinja

hello-unit:
  file.managed:
    - name: /etc/systemd/system/hello-svc.service
    - source: salt://hello/hello-svc.service

hello-service:
  service.running:
    - name: hello-svc
    - enable: True
    - watch:
      - file: hello-binary
      - file: hello-env
      - file: hello-unit
