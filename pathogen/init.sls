# https://github.com/tpope/vim-pathogen#installation

vim:
  pkg.installed

{%- for name, user in pillar.get('users', {}).items() %}

/home/{{name}}/.vim/autoload:
  file.directory:
    - user: {{ name }}
    - group: {{ name }}    
    - dir_mode: 755
    - require_in:
      - file: pathogen_vim

pathogen_vim:
  file.managed:
    - name: /home/{{ name }}/.vim/autoload
    - source: https://tpo.pe/pathogen.vim

{% endfor %}

