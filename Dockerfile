# Use the official Python image as the base image
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container and install dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app's source code into the container
COPY . .

# Expose the port on which the Flask app will run (adjust as needed)
EXPOSE 5000

# Define the command to run the Flask app when the container starts
CMD ["python", "main.py"]