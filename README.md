# Docker Installation Wizard using Bash & Zenity

## Overview

The **Docker Installation Wizard** is a Bash script that provides a simple graphical interface using **Zenity** to automate the installation of Docker on Linux systems. Instead of manually running multiple commands, users can install Docker through interactive dialog boxes.

The script checks whether Docker is already installed, detects the operating system, installs Docker using the appropriate package manager, enables and starts the Docker service, and verifies the installation.

---

## Features

- Graphical user interface using Zenity
- Automatic Docker installation
- Detects the operating system automatically
- Supports Ubuntu, Debian, CentOS, and RHEL
- Checks if Docker is already installed
- Enables and starts the Docker service
- Verifies successful installation
- User-friendly error handling

---

## Technologies Used

- Bash Shell Scripting
- Zenity
- Docker
- systemd
- APT (Ubuntu/Debian)
- DNF/YUM (RHEL/CentOS)

---

## Prerequisites

Before running the script, ensure that:

- Linux operating system
- Root or sudo privileges
- Internet connection
- Zenity installed
- Red Hat systems should have valid repositories or subscription enabled

---

## Project Structure

```
Docker-Installation-Wizard/
│
├── Docker_gui.sh
├── README.md

```

---

## Installation Steps

### 1. Clone the Repository

```bash
git clone https://github.com/<your-username>/Docker-Installation-Wizard.git
```

### 2. Move to the Project Directory

```bash
cd Docker-Installation-Wizard
```

### 3. Give Execute Permission

```bash
chmod +x Docker_gui.sh
```

### 4. Run the Script

```bash
sudo ./Docker_gui.sh
```

---

## Workflow

1. Welcome screen is displayed.
2. Checks whether Docker is already installed.
3. Requests user confirmation.
4. Detects the operating system.
5. Installs Docker using the appropriate package manager.
6. Enables and starts the Docker service.
7. Verifies the installation.
8. Displays a success message.

---

## Verification

Check the installed Docker version.

```bash
docker --version
```

Check Docker service status.

```bash
systemctl status docker
```

Run a test container.

```bash
docker run hello-world
```

---

## Expected Output

- Docker is installed successfully.
- Docker service is active.
- `docker --version` displays the installed version.
- `hello-world` container runs successfully.



## Conclusion

This project simplifies Docker installation by combining Bash scripting with a graphical interface using Zenity. It reduces manual configuration, improves user experience, and provides an easy way to install and verify Docker on supported Linux distributions.
