FROM python:3.8.6

# setup environment variable
ENV APPHOME=/home/apps/hyperX

# set work directory
RUN mkdir -p APPHOME

# where your code lives
WORKDIR $APPHOME


# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Copy the application code to the container
COPY . $APPHOME

# Copy only the requirements file to the container
COPY requirements.txt $APPHOME/

# Install any necessary dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose the port that the app will run on
EXPOSE 8000

# Run the command to start the server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]