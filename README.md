# Hello-DevOps

Ez a projekt DevOps technológiák használatát mutatja be.
Az alkalmazás Vue.js és Vite használatával készült.

Felhasznált technológiák:

Git verziókezelés
Docker konténerizáció
CI/CD automatizáció
Terraform infrastruktúra-kezelés
Dev Container fejlesztői környezet
Render alapú deploy

---

# Projekt funkciók

- Vue.js alkalmazás
- Dockerizált futtatás
- GitHub Actions CI pipeline
- Docker Hub registry publish
- Dev Container támogatás
- Terraform Infrastructure as Code
- Render Deploy

---

# Requirements

## Required

- VS Code https://code.visualstudio.com/download
- VS Code Vue (Official)
- VS Code Dev Containers extension
- Git: https://git-scm.com/
- Node.js: https://nodejs.org/
- Docker Desktop: https://www.docker.com/products/docker-desktop/
- Terraform: https://developer.hashicorp.com/terraform/downloads


# Projekt indítása lokálisan

## Repo klónozása

```bash
VS Code terminálban célszerű a mappát kiválasztani előtte ahova a clone kerüljön majd ird be:
git clone https://github.com/verfurdo/hello-devops.git
```

## Függőségek telepítése

```bash
VS Code terminálban lépj be a projekt mappájába ahol `package.json` fájl is található majd:
npm install

Ha az `npm install` parancs nem indul el futtasd ezt:

```
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
Ezután indítsd újra a VS Code terminált.
```
```

## Webszerver indítása

```bash
npm run dev
```

## Elérés

```text
http://localhost:5173
```

---

## Build és futtatás

### Build készítése

```bash
npm run build
```

A buildelt fájlok a `dist` mappába kerülnek majd.

### Build futtatása

A `dist/index.html` fájlt nem ajánlott közvetlenül megnyitni, mert a böngésző blokkolhatja a JS és CSS fájlokat.

A build futtatása ezért:

```bash
npm run preview
```

Ezután a terminálban megjelenő localhost címen érhető el az alkalmazás.

# Docker

## Docker image build

```bash
docker build -t hello-devops .
```

## Docker container futtatás

```bash
docker run -p 5173:5173 hello-devops
```

## Elérés

```text
http://localhost:5173
```

---

# Docker Hub Registry

## Registry URL

https://hub.docker.com/r/verfurdo/hello-devops

## Image pull

```bash
docker pull verfurdo/hello-devops
```

## Container futtatása Docker Hub image-ből

```bash
docker run -p 5173:5173 verfurdo/hello-devops
```

---

# CI Pipeline

GitHub Actions pipeline automatikusan:

- pullolja a kódot,
- buildeli az alkalmazást,
- buildeli a Docker image-et,
- pusholja Docker Hub registrybe.

Pipeline fájl:

```text
.github/workflows/ci.yml
```

A pipeline minden push esetén lefut a `main` branchre.

---

# Dev Container

VS Code Dev Container használata.

## Szükséges

- Docker Desktop
- VS Code
- Dev Containers extension

## Indítás

VS Code-ban:

```text
Ctrl + Shift + P
```

Majd:

```text
Dev Containers: Reopen in Container
```

## Konténeren belüli indítás

```bash
npm run dev
```

---

# Terraform Infrastructure

Terraform Docker provider használatával infrastruktúra definiálása is megtörtént.

A Terraform:
- lehúzza a Docker Hub image-et,
- létrehozza a Docker konténert,
- megnyitja a szükséges portot.

Terraform fájl:

```text
terraform/main.tf
```

## Provider

Docker provider

## Terraform parancsok

### Inicializálás

```bash
Docker Desktop alkalmazást indítsd el majd lépj be a terraform könyvtárba a vscode terminálban
terraform init
```

### Terv megtekintése

```bash
terraform plan
```

### Infrastruktúra létrehozása

```bash
terraform apply
A kérdésre írd be: yes
```

## Terraform elérés

```text
Ezután menni fog az elérés:
http://localhost:5174
```

### Infrastruktúra törlése kilépés terraformból

```bash
terraform destroy
A kérdésre írd be: yes
```

---

# Használt technológiák

- Vue.js
- Vite
- Docker
- Docker Hub
- Git
- GitHub Actions
- Terraform
- Dev Containers
- Render Deploy

---

# Repository struktúra

```text
hello-devops/
│
├── .devcontainer/
├── .github/workflows/
├── terraform/
├── src/
├── public/
├── Dockerfile
├── README.md
├── package.json
└── vite.config.js
```
