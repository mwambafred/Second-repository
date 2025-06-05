#use nginx as the base image
FROM nginx:alpine

#Remove the default nginx index page
RUN rm -rf/usr/share/nginx/html/*


#copy our html file to the nginx html directory
COPY index.html /usr/share/nginx/html/index.html 
