# 42cursus_inception
This project aims to broaden your knowledge of System Administration by using Docker.

This project consists in having you set up a small infrastructure composed of different
services under specific rules. The whole project has to be done in a virtual machine. You
have to use docker compose. You can see the subject [**HERE.**](https://github.com/MGuardia10/42cursus/blob/main/subjects/en/inception_subject_en.pdf)

![Docker](https://img.shields.io/badge/Docker-a?style=for-the-badge&logo=docker&color=grey)
![Bash](https://img.shields.io/badge/Bash-a?style=for-the-badge&logo=GNUBash&color=grey)
![Makefile](https://img.shields.io/badge/Makefile-a?style=for-the-badge&logo=monster&logoColor=orange&color=grey)

<details>
  <summary><strong>Rules to follow:</strong></summary>
  <br>
  <ul>
    <li>Each Docker image must have the same name as its corresponding service.</li>
    <li>Each service has to run in a dedicated container.</li>
    <li>For performance matters, the containers must be built either from the penultimate stable version of <strong>Alpine</strong> or <strong>Debian</strong>.</li>
    <li>You also have to write your own <strong>Dockerfiles</strong>, one per service. The Dockerfiles must be called in your <strong>docker-compose.yml</strong> by your Makefile.</li>
    <li>It means you have to build yourself the Docker images of your project. It is then forbidden to pull ready-made Docker images, as well as using services such as <strong>DockerHub</strong> (Alpine/Debian being excluded from this rule).</li>
  </ul>
</details>

<details>
  <summary><strong>Diagram of the expected result for mandatory part:</strong></summary>
  <br>
  <ul>
    <img width="566" alt="diagram of expected result" src="https://github.com/user-attachments/assets/72388c94-a7b8-4b0b-ac4b-bf4ff060bef0">
  </ul>
</details>

<details>
  <summary><strong>Expected directory structure:</strong></summary>
  <br>
  <ul>
    <img width="539" alt="Expected directory structure" src="https://github.com/user-attachments/assets/c4dabb84-23f6-4947-9650-9fe80375d747">
  </ul>
</details>

## Mandatory part

List of services and volumes to set up for the mandatory part:
- A Docker container that contains **NGINX** with TLSv1.2 or TLSv1.3 only.
- A Docker container that contains **WordPress + php-fpm** (it must be installed and configured) only without nginx.
- A Docker container that contains **MariaDB** only without nginx.
- A volume that contains your **WordPress database**.
- A second volume that contains your **WordPress website** files.
- A **docker-network** that establishes the connection between your containers.

## Bonus Part
A Dockerfile must be written for each extra service. Thus, each one of them will run inside its own container and will have, if necessary, its dedicated volume.

Bonus list:
- Set up **redis cache** for your WordPress website in order to properly manage the
cache.
- Set up a **FTP server** container pointing to the volume of your WordPress website.
- Create a simple **static website** in the language of your choice except PHP. For example, a showcase site or a site for presenting your resume.
- Set up **Adminer**.
- Set up a service of your choice that you think is useful. I am using **Grafana**.

## Disclaimer
> At [42School](https://en.wikipedia.org/wiki/42_(school)), almost every project must be written in accordance to the [Norm](https://github.com/MGuardia10/42cursus/blob/main/subjects/en/norm_en.pdf), the school's coding standard. As a result, the implementation of certain parts may appear strange and for sure had room for improvement.

