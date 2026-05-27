# Node.js 20-as image
FROM node:20

# konténeren belül létrehoz egy app mappát
WORKDIR /app

# Mindent másol
COPY . .

# npm csomagok telepítése (Vue + Vite)
RUN npm install

# Vite fejlesztői szerver portja
EXPOSE 5173

# elindítja a Vue appot Dockerben
CMD ["npm", "run", "dev", "--", "--host"]
