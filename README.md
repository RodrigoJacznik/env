# environment

Repositorio personal para configurar Arch Linux 

---

## Contenido

- `scripts/`: scripts individuales para instalar aplicaciones y configurar el sistema (audio, bluetooth, i3, etc.).
- `env/`: contiene dotfiles organizados para ser gestionados con [GNU Stow](https://www.gnu.org/software/stow/).
- `setup.sh`: script principal para ejecutar todos los scripts de instalación y aplicar mis configuraciones personales.

---

## Antes de instalar

- Crea usuario no root

```bash
useradd -m -G wheel [user]
passwd [user]

sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

exit
```

## Instalación

```bash
git clone https://github.com/rodrigojacznik/env.git
cd environment 
chmod +x setup.sh scripts/*.sh
./setup.sh
```
