FROM node:9-slim
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "start"]



# FROM node:9-slim: Pulls the base image from DockerHub that includes minimal packages to run Node.js.
# WORKDIR /app: Sets the working directory for the project.
# COPY package*.json /app: Copies both the package.json and package-lock.json to the app directory. Notice that we copy package.json and the rest of the application in separate steps. Docker can cache existing image layers, so if the application code changes but package.json remains the same, node_modules won't be reinstalled.
# RUN npm install: Installs the packages mentioned in package.json.
# COPY . /app: Copies the rest of the application to the directory.
# CMD ["npm", "start"]: Starts the application
