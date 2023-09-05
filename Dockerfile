# Use a base image with your desired runtime (e.g., Node.js, Python, Nginx)
FROM node:14

# Set the working directory
WORKDIR /app

# Copy your HTML file and server script (assuming server.js)
COPY index.html .
COPY server.js .

# Install any dependencies if needed (e.g., for Node.js)
# RUN npm install

# Expose the port your server listens on (e.g., 80 for HTTP)
EXPOSE 8081

# Define the command to start your server
CMD ["node", "server.js"]
