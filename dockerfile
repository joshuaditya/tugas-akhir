# Use the official Node.js image
FROM node:20-alpine

# Create a new user and group with UID and GID 1000
RUN addgroup -g 1001 ahmdgroup && adduser -u 1001 -G ahmdgroup -s /bin/sh -D ahmduser

# Set the working directory to the user's home directory
WORKDIR /home/ahmd

# Create the directory if it doesn't exist and change its owner
RUN mkdir -p /home/ahmd

# Copy the application code from the host to the container and change its owner
COPY source/ /home/ahmd/
RUN chown -R ahmduser:ahmdgroup /home/ahmd

# Install application dependencies as the user
USER ahmduser
RUN npm install

# Expose the necessary port
EXPOSE 3000

# Run the application as the user
CMD [ "node", "app.js" ]
