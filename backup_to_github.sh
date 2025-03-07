#!/bin/bash
# Backup script for AutoShorts-PreWebApp

# Colors for terminal output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}AutoShorts-PreWebApp GitHub Backup Tool${NC}"
echo "===================================="

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo -e "${RED}Error: git is not installed. Please install git first.${NC}"
    exit 1
fi

# Get the directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# Check if .git directory exists
if [ ! -d ".git" ]; then
    echo -e "${YELLOW}Initializing git repository...${NC}"
    git init
    git remote add origin https://github.com/G4Q95/AutoShorts-PreWebApp.git
    echo "Repository initialized and connected to GitHub."
fi

# Ask for commit message
echo -e "${YELLOW}Enter a brief description of your changes:${NC}"
read -p "> " commit_message

if [ -z "$commit_message" ]; then
    # Use a default message if none provided
    commit_message="Updated AutoShorts files on $(date '+%Y-%m-%d %H:%M:%S')"
fi

# Add all files that are not in .gitignore
echo -e "${YELLOW}Adding files to git...${NC}"
git add .

# Show which files will be committed
echo -e "${YELLOW}Files to be committed:${NC}"
git status --short

# Confirm before committing
echo -e "${YELLOW}Do you want to proceed with the backup? (y/n)${NC}"
read -p "> " confirm

if [[ $confirm != [yY] && $confirm != [yY][eE][sS] ]]; then
    echo -e "${RED}Backup cancelled.${NC}"
    exit 0
fi

# Commit changes
echo -e "${YELLOW}Committing changes...${NC}"
git commit -m "$commit_message"

# Push to GitHub
echo -e "${YELLOW}Pushing to GitHub...${NC}"
git push -u origin main

# Check if push was successful
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Backup completed successfully!${NC}"
    echo -e "View your repository at: ${GREEN}https://github.com/G4Q95/AutoShorts-PreWebApp${NC}"
else
    echo -e "${RED}Error pushing to GitHub. Please check your internet connection and GitHub access.${NC}"
    echo -e "You can try manually pushing later with: ${YELLOW}git push -u origin main${NC}"
fi 