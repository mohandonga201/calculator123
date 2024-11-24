# Use an official Nginx image as the base
FROM nginx:alpine

# Copy the web application files into the container's HTML directory
COPY ./calculator.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
