# Use the official Python base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt /app/

# Install necessary Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Install MongoDB client dependencies (if needed for pymongo)
RUN apt-get update && apt-get install -y libssl-dev

# Expose the application port (5000)
EXPOSE 5000

# Set environment variables (Mongo URI for MongoDB connection)
# The .env file will be loaded in the container during runtime
ENV FLASK_APP=app.py

# Start the Flask app
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]