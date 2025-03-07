# AutoShorts-PreWebApp

A backup of the Auto Shorts project focusing on video generation from social media content. This repository contains the pre-web app version of the codebase.

## Description

Auto Shorts is a suite of tools for creating short-form videos from social media content. This project downloads content from platforms like Reddit, rewrites the text using AI, generates voice narration, and combines everything into a polished video.

## Key Features

- Downloads images and text from Reddit
- Rewrites content using AI (OpenAI/ChatGPT)
- Generates voice narration with ElevenLabs or Google Text-to-Speech
- Creates videos with blurred backgrounds and proper aspect ratios (720x1280) for TikTok/Shorts
- Handles both single-image and multi-image (slideshow) content

## Project Structure

```
auto_shorts/
├── scripts/                          # All executable scripts
│   ├── reddit_downloader.py          # Content retrieval 
│   ├── chatgpt_rewriter.py           # Text rewriting
│   ├── google_to_elevenlabs.py       # Voice generation
│   ├── merge.sh                      # Video generation
│   └── utils/                        # Utility scripts
│       ├── sanitize.sh
│       ├── simple_merge.sh
│       └── debug.sh
│
├── commands/                         # Command files for easy execution
│   ├── download.command              # Run reddit downloader
│   ├── rewrite.command               # Run GPT rewriter
│   ├── voice.command                 # Run voice generation
│   └── merge.command                 # Run video generation
│
├── configs/                          # All configuration files
│   ├── .env                          # Main environment variables (you need to create this)
│   ├── client_secrets.json           # Google API credentials
│   └── tokens/                       # Authentication tokens
│       ├── google_token.json
│       └── elevenlabs_token.json
│
└── data/                             # Data storage
    ├── temp/                         # Temporary files
    ├── output/                       # Final outputs
    ├── images/                       # Processed images
    └── audio/                        # Generated audio
```

## Requirements

- Python 3.6 or higher
- FFMPEG for video processing
- ImageMagick for image processing
- Various Python packages (see requirements.txt)

## Installation

1. Clone this repository:
   ```
   git clone https://github.com/G4Q95/AutoShorts-PreWebApp.git
   cd AutoShorts-PreWebApp
   ```

2. Create necessary directories:
   ```
   mkdir -p auto_shorts/data/{temp,output,images,audio,debug}
   mkdir -p auto_shorts/configs/tokens
   ```

3. Set up your configuration:
   Create a `.env` file in the `auto_shorts/configs/` directory with the following content:
   ```
   OPENAI_API_KEY=your_openai_key
   ELEVENLABS_API_KEY=your_elevenlabs_key
   REDDIT_CLIENT_ID=your_reddit_client_id
   REDDIT_CLIENT_SECRET=your_reddit_client_secret
   ```

4. Make scripts executable:
   ```
   chmod +x auto_shorts/scripts/*.sh
   chmod +x auto_shorts/commands/*.command
   ```

## Usage

The Auto Shorts workflow consists of four main steps:

1. **Content Retrieval**: Run `commands/download.command` to download content from Reddit
2. **Text Rewriting**: Run `commands/rewrite.command` to rewrite the text using OpenAI
3. **Voice Generation**: Run `commands/voice.command` to generate voice narration using ElevenLabs
4. **Video Creation**: Run `commands/merge.command` to combine everything into a video

### Video Creation Details

The `merge.sh` script handles processing both single-image and multi-image (slideshow) posts:

- Single images are processed with a direct approach that creates beautiful blurred backgrounds
- Multi-image slideshows use a more complex method that ensures smooth transitions
- All videos are created with 720x1280 dimensions (9:16 aspect ratio)

## Version Control Benefits

This GitHub repository allows:
- Tracking changes to scripts and configurations
- Reverting to previous versions if needed
- Collaborating with others
- Having a backup of your work
- Documenting improvements and bugfixes

## License

This project is for personal use only. Please respect copyright and terms of service for all platforms and APIs used.

## Acknowledgments

- FFMPEG for video processing
- OpenAI for text generation
- ElevenLabs for voice generation
- Reddit for content sources