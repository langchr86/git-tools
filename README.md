git-tools
=========

[![Build Status](https://travis-ci.com/langchr86/git-tools.svg?branch=master)](https://travis-ci.com/langchr86/git-tools)

Ansible role which does prepare some usual needed settings, aliases and other tools for effective git usage.


Requirements
------------

This role should work on most linux distributions.
Tested on Ubuntu 18.04.
The only requirements is bash, if the git prompt feature is activated.


Role Variables
--------------

All variable that may be manipulated by the user are collected in defaults/main.yml.
See the inline description there.

Dependencies
------------

This role is completely self-containing and has no dependencies.


Example Playbook
----------------

See `tests` folder for example playbooks.

To be able to install the role you can use the command:

~~~
ansible-galaxy install git+https://github.com/langchr86/git-tools.git,master
~~~

or you define it in the `requirements.yml` file:

~~~
collections:
# With the collection name, version, and source options
- name: langchr86.git-tools
  version: 'master'
  source: 'git+https://github.com/langchr86/git-tools.git'
~~~

and then install with:

~~~
ansible-galaxy install -r requirements.yml
~~~


License
-------

MIT

Author Information
------------------

Christian Lang
[lang.chr86@gmail.com](mailto:lang.chr86@gmail.com)
