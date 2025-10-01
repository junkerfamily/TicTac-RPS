#!/bin/bash

# Script to commit and push code to GitHub repository
# Repository: junkerfamily/tictac-rps

echo "🚀 Preparing to commit and push to GitHub..."

# Navigate to project directory
cd "$(dirname "$0")"

# Check if there are any changes to commit
if [ -n "$(git status --porcelain)" ]; then
    echo "📝 Changes detected. Adding files to staging..."
    git add .
    
    # Prompt for commit message
    echo "💬 Please enter your commit message:"
    read -r commit_message
    
    if [ -z "$commit_message" ]; then
        echo "❌ No commit message provided. Exiting."
        exit 1
    fi
    
    echo "💾 Committing changes with message: '$commit_message'"
    git commit -m "$commit_message"
else
    echo "✅ No changes to commit. Working tree is clean."
fi

# Check if remote origin exists, if not add it
if ! git remote get-url origin >/dev/null 2>&1; then
    echo "🔗 Adding GitHub repository as remote origin..."
    git remote add origin https://github.com/junkerfamily/tictac-rps.git
else
    echo "✅ Remote origin already configured."
fi

# Ensure we're on main branch
echo "🌿 Ensuring we're on main branch..."
git branch -M main

# Push to GitHub
echo "⬆️  Pushing to GitHub repository..."
if git push -u origin main; then
    echo "🎉 Successfully pushed to GitHub repository: junkerfamily/tictac-rps"
else
    echo "❌ Failed to push to GitHub. Please check your credentials and try again."
    exit 1
fi

echo "✨ Done!"
