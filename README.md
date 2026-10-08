# django.nV

[django.nV](https://github.com/NetSPI/django.nV) by nVisium (now NetSPI): a purposefully
vulnerable Django task manager with projects, tasks, notes and file uploads, and built-in
tutorials describing each vulnerability. This repository runs it with
[Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml) describes the machine, and the
upstream source in [`build/web/app/`](build/web/app) runs in a Python 3.5 / Django 1.8 image
written for it (upstream ships no Dockerfile), with the SQLite database created from upstream's
fixtures at build.

| Machine | Service |
| --- | --- |
| web | django.nV (Django 1.8 development server) on port 8000, published on 8029 |

## Run it

```bash
isoloom generate
isoloom run docker
```

Then open http://localhost:8029/taskManager/ and register an account. The Tutorials link (top
right) describes each vulnerability. The same spec runs as Docker on a local VM (`docker-vm`), on
a cloud VM (`cloud-docker`) or on Kubernetes. Lab guide: the in-app tutorials and the
[django.nV README](https://github.com/NetSPI/django.nV#readme).

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

GPL-2.0, as django.nV ([LICENSE](LICENSE), upstream's `LICENSE.md`). This application is
deliberately vulnerable: keep it isolated.
