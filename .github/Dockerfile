# Use Nginx to serve static content
FROM nginx:alpine

# Remove the default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy our HTML file
COPY index.html /usr/share/nginx/html/index.html