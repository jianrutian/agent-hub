#!/bin/bash

# 设置项目根目录
PROJECT_ROOT="arxiv_hunting"

# 创建目录结构
mkdir -p $PROJECT_ROOT/config
mkdir -p $PROJECT_ROOT/arxiv_hunting/subscriptions
mkdir -p $PROJECT_ROOT/arxiv_hunting/fetching
mkdir -p $PROJECT_ROOT/arxiv_hunting/notifications
mkdir -p $PROJECT_ROOT/arxiv_hunting/reports
mkdir -p $PROJECT_ROOT/arxiv_hunting/database
mkdir -p $PROJECT_ROOT/arxiv_hunting/ui
mkdir -p $PROJECT_ROOT/tests

# 创建配置文件
cat <<EOL > $PROJECT_ROOT/config/config.yaml
# Configuration file for ArXiv Hunting

# Example content:
# database:
#   path: "/path/to/database.db"
EOL

# 创建主入口文件
cat <<EOL > $PROJECT_ROOT/arxiv_hunting/main.py
# Main entry point for ArXiv Hunting project

def main():
    print("ArXiv Hunting is running!")

if __name__ == "__main__":
    main()
EOL

# 创建 __init__.py 文件
touch $PROJECT_ROOT/arxiv_hunting/__init__.py
touch $PROJECT_ROOT/arxiv_hunting/subscriptions/__init__.py
touch $PROJECT_ROOT/arxiv_hunting/fetching/__init__.py
touch $PROJECT_ROOT/arxiv_hunting/notifications/__init__.py
touch $PROJECT_ROOT/arxiv_hunting/reports/__init__.py
touch $PROJECT_ROOT/arxiv_hunting/database/__init__.py
touch $PROJECT_ROOT/arxiv_hunting/ui/__init__.py

# 创建 SubscriptionManager
cat <<EOL > $PROJECT_ROOT/arxiv_hunting/subscriptions/manager.py
# Subscription management module

class SubscriptionManager:
    def __init__(self, db_manager):
        self.db_manager = db_manager

    def add_subscription(self, user_id, category, keywords):
        # Add a subscription to the database
        pass

    def remove_subscription(self, user_id, subscription_id):
        # Remove a subscription from the database
        pass

    def list_subscriptions(self, user_id):
        # List all subscriptions for a user
        pass
EOL

# 创建 PaperFetcher
cat <<EOL > $PROJECT_ROOT/arxiv_hunting/fetching/fetcher.py
# Paper fetching module

import requests

class PaperFetcher:
    def __init__(self, subscriptions):
        self.subscriptions = subscriptions

    def fetch_latest_papers(self):
        # Fetch the latest papers from ArXiv based on subscriptions
        pass

    def parse_papers(self, xml_data):
        # Parse the fetched paper data
        pass
EOL

# 创建 Notifier
cat <<EOL > $PROJECT_ROOT/arxiv_hunting/notifications/notifier.py
# Notification system module

import smtplib
from email.mime.text import MIMEText

class Notifier:
    def __init__(self, user_email):
        self.user_email = user_email

    def send_notification(self, paper_list):
        # Send a notification to the user
        pass
EOL

# 创建 ReportGenerator
cat <<EOL > $PROJECT_ROOT/arxiv_hunting/reports/generator.py
# Report generation module

class ReportGenerator:
    def __init__(self, papers):
        self.papers = papers

    def generate_report(self):
        # Generate a report (e.g., PDF or HTML)
        pass
EOL

# 创建 DatabaseManager
cat <<EOL > $PROJECT_ROOT/arxiv_hunting/database/db_manager.py
# Database management module

import sqlite3

class DatabaseManager:
    def __init__(self, db_path):
        self.conn = sqlite3.connect(db_path)
        self.create_tables()

    def create_tables(self):
        # Create necessary database tables
        pass

    def add_record(self, table, data):
        # Add a record to the database
        pass

    def remove_record(self, table, record_id):
        # Remove a record from the database
        pass

    def fetch_records(self, table, query):
        # Fetch records from the database
        pass
EOL

# 创建命令行界面
cat <<EOL > $PROJECT_ROOT/arxiv_hunting/ui/cli.py
# Command-line interface for ArXiv Hunting

import click
from arxiv_hunting.subscriptions.manager import SubscriptionManager

@click.group()
def cli():
    pass

@cli.command()
@click.option('--category', prompt='ArXiv category')
@click.option('--keywords', prompt='Keywords', default="")
def subscribe(category, keywords):
    # Handle user subscription
    pass

@cli.command()
def fetch():
    # Handle paper fetching
    pass

if __name__ == '__main__':
    cli()
EOL

# 创建测试文件
touch $PROJECT_ROOT/tests/test_subscriptions.py
touch $PROJECT_ROOT/tests/test_fetching.py
touch $PROJECT_ROOT/tests/test_notifications.py
touch $PROJECT_ROOT/tests/test_reports.py
touch $PROJECT_ROOT/tests/test_database.py

# 创建 README 和 setup 文件
cat <<EOL > $PROJECT_ROOT/README.md
# ArXiv Hunting

ArXiv Hunting is an open-source tool designed for AI researchers and developers, enabling them to automatically fetch and summarize the latest AI papers from ArXiv.
EOL

cat <<EOL > $PROJECT_ROOT/setup.py
from setuptools import setup, find_packages

setup(
    name="arxiv_hunting",
    version="0.1",
    packages=find_packages(),
    install_requires=[
        "requests",
        "click",
        "sqlite3"
    ],
    entry_points={
        'console_scripts': [
            'arxiv-hunting=arxiv_hunting.ui.cli:cli',
        ],
    },
)
EOL

cat <<EOL > $PROJECT_ROOT/requirements.txt
requests
click
sqlite3
EOL

echo "Project structure generated successfully in $PROJECT_ROOT"
