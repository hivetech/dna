# pkg.install
#
# Install vim package and copy standard vimrc file
vim:
  pkg:
    - installed
    {% if grains['os_family'] == 'RedHat' %}
    - name: vim-enhanced
    {% elif grains['os'] == 'Debian' %}
    - name: vim-nox
    {% endif %}

/etc/vimrc:
  file:
    - managed
    - source: salt://vim/vimrc
    - user: root
    - group: root
    - mode: 644
    #- template: jinja
    #- makedirs: True
    - require:
      - pkg: vim
