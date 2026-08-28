# apt-cleanup


![Bash](https://img.shields.io/badge/Bash-4EAA25?style=flat&logo=gnubash&logoColor=white)
![Status](https://img.shields.io/badge/status-learning%20project-blue)
![Last Commit](https://img.shields.io/github/last-commit/Calpira/apt-cleanup)
![License](https://img.shields.io/badge/license-MIT-blue)


Script de limpieza para sistemas basados en Debian/Ubuntu (probado en Linux Mint).

> Proyecto con fines de estudio: No es una herramienta profesional ni está pensada para producción — en caso de usar, revisar el código antes de correrlo.

---

## Qué hace

- Limpia caché de paquetes de APT (`apt clean`, `apt autoclean`)
- Elimina paquetes huérfanos (`apt autoremove --purge`)
- Repara paquetes pendientes (`dpkg --configure -a`, `apt --fix-broken install`)
- Purga logs de más de 30 días (`journalctl --vacuum-time`)
- Limpia la caché (`~/.cache`) de todos los usuarios del sistema
- Limpia miniaturas viejas
- Vacía la papelera de reciclaje de todos los usuarios
- Muestra el espacio en disco liberado al finalizar

## Requisitos

- Distro basada en Debian/Ubuntu (usa `apt`)
- systemd (usa `journalctl`)

---

## Instalación

```
git clone https://github.com/Calpira/apt-cleanup.git
cd apt-cleanup
chmod +x apt-cleanup.sh
```

## Uso

```
sudo ./apt-cleanup.sh
```

---

## Problemas conocidos

En algunos casos, mientras el script corre, la terminal puede dejar de responder al teclado. Todavía no identifiqué la causa exacta — probablemente relacionado con Cinnamon (el entorno de escritorio), no con el script en sí. En la practica se reesstablece reiniciando el entorno de escritorio (`Ctrl+Alt+Esc`)

