# Stage 1: Build the Flutter web application
FROM ubuntu:latest AS builder

# Install dependencies
RUN apt-get update && apt-get install -y curl git unzip xz-utils zip libglu1-mesa

# Set up Flutter environment variables
ENV FLUTTER_HOME=/usr/local/flutter
ENV PATH=$FLUTTER_HOME/bin:$FLUTTER_HOME/bin/cache/dart-sdk/bin:$PATH

# Download and install Flutter SDK
RUN git clone https://github.com/flutter/flutter.git $FLUTTER_HOME
RUN flutter doctor

# Copy the Flutter web application code to the container
COPY . /app
WORKDIR /app

# Build the Flutter web application
RUN flutter build web

# Stage 2: Create the Nginx container
FROM nginx:latest

# Copy the built Flutter web application to the Nginx container
COPY --from=builder /app/build/web /usr/share/nginx/html

# Expose port 80 for the Nginx server
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]