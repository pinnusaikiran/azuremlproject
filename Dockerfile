FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy requirements first (for Docker layer caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose the port Flask will run on
EXPOSE 5000

# Start the application with Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]