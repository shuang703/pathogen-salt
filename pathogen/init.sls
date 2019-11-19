# https://github.com/tpope/vim-pathogen#installation

vim:
  pkg.installed

{%- for name, user in pillar.get('users', {}).items() %}

vim_autoload:
  file.directory:
    - name: /home/{{ name }}/.vim/autoload
    - user: {{ name }}
    - group: {{ name }}    
    - dir_mode: 755

pathogen_vim:
  file.managed:
    - name: /home/{{ name }}/.vim/autoload/pathogen.vim
    - source: https://tpo.pe/pathogen.vim

{% endfor %}

