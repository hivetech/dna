# pkg.install
# Bash and zsh common configuration commands
#TODO Find out user home
/home/user:
  file.managed:
    - managed
    - source: salt://shell/commonrc.sh
    - user: root
    - group: root
    - mode: 644
    #- template: jinja
    #- makedirs: True
    
#TODO common-alias.sh
#TODO custom-alias.sh
#TODO customrc.sh
