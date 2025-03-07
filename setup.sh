#!/bin/bash
# Setup script for AutoShorts-PreWebApp

# Colors for terminal output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${YELLOW}AutoShorts-PreWebApp Setup Script${NC}"
echo "===================================="

# Create required directories
echo -e "${BLUE}Creating directory structure...${NC}"
mkdir -p auto_shorts/data/{temp,output,images,audio,debug}
mkdir -p auto_shorts/configs/tokens
mkdir -p auto_shorts/scripts/utils
mkdir -p auto_shorts/commands

echo -e "${BLUE}Setting up .gitignore...${NC}"
if [ ! -f ".gitignore" ]; then
    cat > .gitignore << EOL
# Auto Shorts .gitignore file

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Data directories (large files)
auto_shorts/data/temp/
auto_shorts/data/output/*.mp4
auto_shorts/data/debug/

# Sensitive information
auto_shorts/configs/.env
auto_shorts/configs/client_secrets.json
auto_shorts/configs/tokens/

# Python related
__pycache__/
*.py[cod]
*$py.class
.Python
env/
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
*.egg-info/
.installed.cfg
*.egg

# Virtual Environment
venv/
.env
EOL
    echo -e "${GREEN}Created .gitignore file${NC}"
else
    echo -e "${YELLOW}.gitignore already exists${NC}"
fi

# Create a template .env file
echo -e "${BLUE}Creating template .env file...${NC}"
if [ ! -f "auto_shorts/configs/.env.template" ]; then
    mkdir -p auto_shorts/configs
    cat > auto_shorts/configs/.env.template << EOL
# AutoShorts API Configuration
# Copy this file to .env and update with your actual API keys

# OpenAI API for text rewriting
OPENAI_API_KEY=your_openai_api_key_here

# ElevenLabs API for voice generation
ELEVENLABS_API_KEY=your_elevenlabs_api_key_here

# Reddit API for content download
REDDIT_CLIENT_ID=your_reddit_client_id_here
REDDIT_CLIENT_SECRET=your_reddit_client_secret_here
REDDIT_USER_AGENT=script:autoshorts:v1.0 (by /u/your_username)

# Google API for Google Drive integration
GOOGLE_API_KEY=your_google_api_key_here
EOL
    echo -e "${GREEN}Created .env.template file${NC}"
    echo -e "${YELLOW}Please copy auto_shorts/configs/.env.template to auto_shorts/configs/.env and add your API keys${NC}"
else
    echo -e "${YELLOW}.env.template already exists${NC}"
fi

echo -e "\n${GREEN}Setup completed successfully!${NC}"
echo -e "Next steps:"
echo -e "1. Copy your Auto Shorts scripts into the auto_shorts directory"
echo -e "2. Copy auto_shorts/configs/.env.template to auto_shorts/configs/.env and add your API keys"
echo -e "3. Run ./backup_to_github.sh to backup your code to GitHub" 