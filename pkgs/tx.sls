tx-package:
  pkg.installed:
    - name: transmission-daemon
    - require_in: tx-service

tx-service:
  service.running:
    - name: transmission-daemon
    - require:
      - file: tx-config

tx-config:
  file.recurse:
    - name: /etc/transmission-daemon
    - source: salt://_config/tx
    - file_mode: 660
    - dir_mode: 775
    - user: root
    - group: debian-transmission
    - template: jinja
