# Utiliser une image nginx comme base
FROM nginx:latest

# Installer le package 'file' pour les vérifications d'image
RUN apt-get update && apt-get install -y file

# Créer le répertoire requis pour les fichiers du site
RUN mkdir -p /var/concentration/html

# Copier les sources HTML du site dans le conteneur
COPY html /var/concentration/html

# Copier le fichier de configuration nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Exposer le port 80 pour accéder au site
EXPOSE 8080

# Démarrer nginx
CMD ["nginx", "-g", "daemon off;"]
