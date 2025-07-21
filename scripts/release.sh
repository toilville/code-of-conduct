#!/bin/bash

# Release Helper Script for Code of Conduct Repository
# This script helps maintainers create releases following best practices

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if version is provided
if [ $# -eq 0 ]; then
    print_error "Please provide a version number (e.g., v1.3.0)"
    echo "Usage: $0 <version>"
    echo "Example: $0 v1.3.0"
    exit 1
fi

VERSION=$1

# Validate version format
if [[ ! $VERSION =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    print_error "Invalid version format. Use format: v1.2.3"
    exit 1
fi

print_status "Starting release process for $VERSION"

# Check if we're on main branch
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "main" ]; then
    print_warning "You're not on the main branch (current: $CURRENT_BRANCH)"
    read -p "Continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_status "Aborting release"
        exit 1
    fi
fi

# Check for uncommitted changes
if [ -n "$(git status --porcelain)" ]; then
    print_error "You have uncommitted changes. Please commit or stash them first."
    git status --porcelain
    exit 1
fi

# Check if tag already exists
if git tag -l | grep -q "^$VERSION$"; then
    print_error "Tag $VERSION already exists"
    exit 1
fi

# Validate CHANGELOG.md exists and has the version
if [ ! -f "CHANGELOG.md" ]; then
    print_error "CHANGELOG.md not found"
    exit 1
fi

# Remove 'v' prefix for CHANGELOG lookup
CHANGELOG_VERSION=${VERSION#v}

if ! grep -q "## \[$CHANGELOG_VERSION\]" CHANGELOG.md; then
    print_warning "Version $CHANGELOG_VERSION not found in CHANGELOG.md"
    print_status "Please update CHANGELOG.md with the new version before releasing"
    
    read -p "Open CHANGELOG.md for editing? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        ${EDITOR:-nano} CHANGELOG.md
        print_status "Please commit the CHANGELOG.md changes and run this script again"
        exit 1
    else
        print_status "Aborting release. Please update CHANGELOG.md first."
        exit 1
    fi
fi

# Run validation (if npm is available)
if command -v npm &> /dev/null; then
    print_status "Running validation checks..."
    if npm list markdownlint-cli &> /dev/null; then
        npm run lint || {
            print_error "Linting failed. Please fix issues before releasing."
            exit 1
        }
        print_success "Linting passed"
    else
        print_warning "markdownlint-cli not installed, skipping lint check"
    fi
else
    print_warning "npm not available, skipping validation"
fi

# Create and push tag
print_status "Creating tag $VERSION..."

# Get current date for tag message
CURRENT_DATE=$(date +"%Y-%m-%d")

# Create annotated tag
git tag -a "$VERSION" -m "Release $VERSION ($CURRENT_DATE)

$(awk "/^## \[$CHANGELOG_VERSION\]/ {flag=1; next} /^## \[/ {flag=0} flag" CHANGELOG.md | head -20)"

print_success "Tag $VERSION created locally"

# Push tag
print_status "Pushing tag to origin..."
git push origin "$VERSION"

print_success "Tag $VERSION pushed to origin"

print_status "Release process completed!"
print_status "GitHub Actions will now create the release automatically."
print_status "Check the Actions tab for progress: https://github.com/toilville/code-of-conduct/actions"

# Wait a moment and try to open the releases page
if command -v open &> /dev/null; then
    read -p "Open GitHub releases page? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        open "https://github.com/toilville/code-of-conduct/releases"
    fi
elif command -v xdg-open &> /dev/null; then
    read -p "Open GitHub releases page? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        xdg-open "https://github.com/toilville/code-of-conduct/releases"
    fi
fi

print_success "Release $VERSION completed successfully!"
print_status "The release should appear at: https://github.com/toilville/code-of-conduct/releases/tag/$VERSION"
