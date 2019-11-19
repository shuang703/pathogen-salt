# https://github.com/tpope/vim-pathogen#installation

vim:
  pkg.installed

{%- for name, user in pillar.get('users', {}).items() %}

/home/{{name}}/.vim:
  file.directory:
    - user: {{ name }}
    - group: {{ name }}    
    - dir_mode: 755

{% endfor %}

