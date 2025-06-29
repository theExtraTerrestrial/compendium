# Assets Directory Structure

This directory contains all static assets for the Flutter Compendium app.

## Directory Organization

```
assets/
├── data/           # JSON data files
│   └── anime_collection.json
└── images/         # Image assets (icons, illustrations, etc.)
```

## Usage

### Data Files
- **Location**: `assets/data/`
- **Purpose**: JSON files containing app data
- **Access**: Use `rootBundle.loadString('assets/data/filename.json')`

### Images
- **Location**: `assets/images/`
- **Purpose**: App icons, illustrations, and other image assets
- **Access**: Use `AssetImage('assets/images/filename.png')` or `Image.asset('assets/images/filename.png')`

## Adding New Assets

1. Place files in the appropriate subdirectory
2. Ensure the directory is registered in `pubspec.yaml` under `flutter.assets`
3. Reference assets using the full path from the project root

## Current Assets

- `data/anime_collection.json` - Sample anime collection data (419 entries)
