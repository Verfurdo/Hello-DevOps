# Hello-DevOps

Vue.js + Docker + CI/CD + Terraform + Dev Container + Deploy projekt.

---

# Projekt funkciók

- Vue.js alkalmazás
- Dockerizált futtatás
- GitHub Actions CI pipeline
- Docker Hub registry publish
- Dev Container támogatás
- Terraform Infrastructure as Code

---

# Projekt indítása lokálisan

## Függőségek telepítése

```bash
npm install
```

## Fejlesztői szerver indítása

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

A buildelt fájlok a `dist` mappába kerülnek.

### Build előnézet futtatása

A `dist/index.html` fájlt nem ajánlott közvetlenül megnyitni (`file://`), mert a böngésző blokkolhatja a JS és CSS fájlokat.

A helyes futtatás:

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

A projekt támogatja a VS Code Dev Container használatát.

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

Terraform Docker provider használatával infrastruktúra definiálása történt.

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
terraform init
```

### Terv megtekintése

```bash
terraform plan
```

### Infrastruktúra létrehozása

```bash
terraform apply
```

### Infrastruktúra törlése

```bash
terraform destroy
```

## Terraform elérés

```text
http://localhost:5174
```

---

# Használt technológiák

- Vue.js
- Vite
- Docker
- Docker Hub
- GitHub Actions
- Terraform
- Dev Containers

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
