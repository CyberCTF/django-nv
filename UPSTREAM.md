# Upstream

| | |
| --- | --- |
| Project | django.nV |
| Repository | https://github.com/NetSPI/django.nV (archived) |
| Version | master (no releases) |
| Commit | a48901f106da4888417339b7b44b8ed56b64c63f |
| Licence | GPL-2.0 |

`build/web/app/` is that commit, unchanged, without its Git history. Upstream has no Dockerfile:
`build/web/Dockerfile` follows its setup on `python:3.5.10-slim-buster` (Django 1.8 supports
Python up to 3.5): `pip install -r requirements.txt` (only `Django==1.8.3`, pinned upstream),
`reset_db.sh` at build, and `manage.py runserver` on `0.0.0.0:8000` instead of upstream's
`runapp.sh` (127.0.0.1). The password-reset mail goes to an SMTP server on localhost:1025 that is
not part of the lab. To update, replace `build/web/app/` with a newer commit, then change this
table.
