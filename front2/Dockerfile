# Stage 1: Build
FROM node:18 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY angular-realworld-example-app/package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application files (including angular.json)
COPY angular-realworld-example-app/ .

# Build the Angular application for production
RUN npm run build --prod

# Stage 2: Serve with Nginx
FROM nginx:1.25 AS serve

# Copy the Angular build artifacts from the build stage to Nginx HTML directory
COPY --from=build /app/dist/angular-conduit /usr/share/nginx/html

# Replace the default Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Change ownership of the Nginx HTML directory to the Nginx user
RUN chown -R nginx:nginx /usr/share/nginx/html

# Expose the default Nginx port
EXPOSE 80

# Run Nginx as the Nginx user
#USER nginx

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
