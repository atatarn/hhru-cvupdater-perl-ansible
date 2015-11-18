# hhru-cvupdater-perl-ansible
Ansible playbook to install my [CV Updater for HH.ru](https://github.com/somepad/hhru-cvupdater-perl) on an empty Debian machine.

## Requirements
Ansible 2.0.0

## Instalation
1. Clone this repo anywhere where you want
2. Edit _playbook.yml_ as you need
3. Run `ansible-playbook playbook.yml`

## HH API Configuration
1. Go to https://dev.hh.ru and register your application
2. Edit _tpl/c_v_updater.conf_ file with your *Client ID* and *Client Secret*. You also may want to change default UserAgent (`UA` section).
*Redirect URI* for your application must be like this: `http(s)://domain.tld/hhcb`