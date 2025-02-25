import logging
import random
import time

# Configure logging
logging.basicConfig(
    format="%(asctime)s - %(levelname)s - %(message)s",
    level=logging.DEBUG,
    handlers=[
        logging.FileHandler("random_logs.log"),
        logging.StreamHandler()
    ]
)

log_levels = [logging.DEBUG, logging.INFO, logging.WARNING, logging.ERROR, logging.CRITICAL]
log_messages = [
    "User logged in successfully",
    "Database connection established",
    "File not found",
    "Low disk space warning",
    "CPU usage is high",
    "Permission denied",
    "Server restarted",
    "Memory allocation failed",
    "Configuration updated",
    "Unexpected exception occurred"
]

def generate_random_logs():
    while True:
        level = random.choice(log_levels)
        message = random.choice(log_messages)
        logging.log(level, message)
        time.sleep(random.uniform(0.5, 2))  # Generate logs at random intervals

if __name__ == "__main__":
    generate_random_logs()



nohup python3 script.py > logs_output.log 2>&1 &