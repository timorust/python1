# Use the official Python image as a base
FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy the Python script into the container
COPY app.py .

# Define the command to run the script
CMD ["python", "app.py"]
