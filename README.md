<p align="center">
  <img src="https://raw.githubusercontent.com/RouHim/ismc-mod-server-container-image/main/.github/readme/logo.png" width="250">
</p>

<p align="center">
    <a href="https://github.com/RouHim/ismc-mod-server-container-image/actions/workflows/pipeline.yml"><img src="https://github.com/RouHim/ismc-mod-server-container-image/actions/workflows/pipeline.yml/badge.svg?branch=main" alt="Pipeline"></a>
    <a href="https://github.com/RouHim/ismc-mod-server-container-image/actions/workflows/scheduled-security-audit.yaml"><img src="https://github.com/RouHim/ismc-mod-server-container-image/actions/workflows/scheduled-security-audit.yaml/badge.svg?branch=main" alt="Pipeline"></a>
    <a href="https://hub.docker.com/r/rouhim/ismc-mod-server-server"><img src="https://img.shields.io/docker/pulls/rouhim/ismc-mod-server-server.svg" alt="Docker Hub pulls"></a>
    <a href="https://hub.docker.com/r/rouhim/ismc-mod-server-server"><img src="https://img.shields.io/docker/image-size/rouhim/ismc-mod-server-server" alt="Docker Hub size"></a>
    <a href="https://github.com/aquasecurity/trivy"><img src="https://img.shields.io/badge/trivy-protected-blue" alt="trivy"></a>
    <a href="https://hub.docker.com/r/rouhim/ismc-mod-server-server/tags"><img src="https://img.shields.io/badge/ARCH-amd64-blueviolet" alt="os-arch"></a>
    <a href="https://buymeacoffee.com/rouhim"><img alt="Donate me" src="https://img.shields.io/badge/-buy_me_a%C2%A0coffee-gray?logo=buy-me-a-coffee"></a>
</p>

<p align="center">
    This repository provides a <a href="https://github.com/RouHim/ismc-mod-server-container-image/actions/workflows/scheduled-security-audit.yaml">safe</a> container image for the <a href="https://ismc-mod-server.com">Insurgency: Sandstorm with ISMC Mod</a> dedicated server.
  It is designed to be used with Docker Compose, making it easy to set up and manage your game server environment.
</p>

## Requirements

* [Docker](https://docs.docker.com/engine/install/)
* [Docker Compose](https://docs.docker.com/compose/install/standalone/)

## Installation

Once _Docker_ and _Docker Compose_ are installed, clone this repository to your local machine:

```bash
git clone https://github.com/RouHim/ismc-mod-server-container-image.git
cd ismc-mod-server-container-image
```

Before starting the server, create the required folder structure, and adjust the permissions:

```bash
mkdir data/ 
chmod 777 data/
```

> The `chmod` command is recommended to avoid permission issues.
> The main reason is, that the user in the container, most likely differs from the user on the host.

## Usage

To start the server, navigate to the cloned repository's directory and use Docker Compose:

```bash
docker compose pull
docker compose up -d
```

This will pull the latest image and start the server in detached mode.

When starting the server for the first time:

* The server will download the latest version of the game from Steam to the `data/` folder.

> You have to restart after the first start.

To restart the server after making changes to the configuration, use the following command:

```bash
docker compose restart
```

To check the server logs, use the following command:

```bash
docker compose logs -f
```

## Update

To update the server, just restart the container.
The server checks for updates and validates on every boot per default.

> To skip update and validation of the server files on every boot,
> set the `FAST_BOOT` env variable to `true`.

## Configuration

> The server configuration does not differ from the official server configuration.
> Just follow an existing server configuration guide
> like [this](https://mod.io/g/insurgencysandstorm/r/server-admin-guide).

The `data/` folder contains the game server data.
Feel free to modify files in this folder,
but be aware that the game server must be restarted for changes to take effect.
The folder can be deleted to reset the game server to its default state.

### Environment variables

| Variable    | Default Value                     | Description                   |
|-------------|-----------------------------------|-------------------------------|
| SERVER_NAME | "My Server"                       | The name of your game server  |
| MAP         | "Oilfield"                        | The map to be loaded          |
| SCENARIO    | "Scenario_Refinery_Push_Security" | The scenario to be played     |
| MAX_PLAYERS | "28"                              | The maximum number of players |

# Resources

- Built from: https://github.com/RouHim/ismc-mod-server-container-image
- Built to: https://hub.docker.com/r/rouhim/ismc-mod-server-server
- Based on: https://github.com/RouHim/steamcmd-container-image
- SteamCMD Documentation: https://developer.valvesoftware.com/wiki/SteamCMD
- Dedicated server guide: https://mod.io/g/insurgencysandstorm/r/server-admin-guide
- ISMC Mod guide: https://mod.io/g/insurgencysandstorm/m/ismcmod1 | https://mod.io/g/insurgencysandstorm/r/ismcmod-installation-guide