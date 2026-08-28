# apt-cleanup


![Bash](https://img.shields.io/badge/Bash-4EAA25?style=flat&logo=gnubash&logoColor=white)
![Status](https://img.shields.io/badge/learning%20project-blue)
![Last Commit](https://img.shields.io/github/last-commit/Calpira/apt-cleanup)
![License](https://img.shields.io/badge/license-MIT-blue)


Script de limpieza para sistemas basados en Debian/Ubuntu (probado en Linux Mint).

> Este proyecto nació con **fines de estudio** de scripting en Bash y automatización local. Si bien realiza tareas estándar de mantenimiento, se recomienda revisar el código antes de ejecutarlo.


## Qué hace
El script ejecuta de manera secuencial las siguientes tareas de administración de sistemas:

- Limpia caché de paquetes de APT (`apt clean`, `apt autoclean`)
- Elimina paquetes huérfanos (`apt autoremove --purge`)
- Repara paquetes pendientes (`dpkg --configure -a`, `apt --fix-broken install`)
- Purga logs de más de 30 días (`journalctl --vacuum-time`)
- Limpia la caché (`~/.cache`) de todos los usuarios del sistema
- Limpia miniaturas viejas
- Vacía la papelera de reciclaje de todos los usuarios
- Muestra el espacio en disco liberado al finalizar

## Requisitos

- Distro basada en Debian/Ubuntu
- systemd 



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



## Comportamiento en Observación

En algunos casos, mientras el script corre, se ha detectado de forma aislada que la terminal puede dejar de responder temporalmente al teclado durante el proceso. El script finaliza sus tareas correctamente y el entorno vuelve a la normalidad reiniciando el gestor de ventanas (`Ctrl+Alt+Esc`).
