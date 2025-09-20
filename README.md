# Interactive Portfolio

A modern, responsive interactive portfolio web application built with Flutter. This project showcases your skills, projects, experience, and contact information in an engaging, web-optimized format.

## Features

- **Hero Section**: Eye-catching introduction with animated elements
- **Skills Section**: Visual representation of your technical skills and expertise
- **About Section**: Personal background and professional summary
- **Projects Section**: Showcase of your key projects with descriptions and links
- **Experience Section**: Timeline of your professional experience
- **Contact Section**: Easy-to-use contact form and social media links
- **Responsive Design**: Optimized for desktop, tablet, and mobile devices
- **Smooth Animations**: Flutter-powered animations for enhanced user experience
- **Web-Optimized**: Built specifically for web deployment with GitHub Pages

## Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK**: Version 3.0 or higher
  - Download from [flutter.dev](https://flutter.dev/docs/get-started/install)
  - Verify installation: `flutter doctor`
- **Git**: For version control and deployment
- **Web Browser**: For testing the application locally

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/interactive_portifolio.git
   cd interactive_portifolio
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Verify Flutter setup**:
   ```bash
   flutter doctor
   ```

## Running Locally

To run the application locally for development and testing:

```bash
flutter run -d web-server
```

This will start a local web server. Open your browser and navigate to the provided URL (typically `http://localhost:8080`).

For a production-like build locally:
```bash
flutter run -d web-server --release
```

## Building for Web

To build the application for web deployment:

```bash
flutter build web --base-href /interactive_portifolio/
```

This command:
- Builds the web version of your Flutter app
- Sets the base href to `/interactive_portifolio/` for proper GitHub Pages routing
- Outputs the build files to the `build/web/` directory

## Deploying to GitHub Pages

Follow these steps to deploy your portfolio to GitHub Pages:

### 1. Create a GitHub Repository

1. Go to [GitHub.com](https://github.com) and sign in
2. Click "New repository"
3. Name it `interactive_portifolio` (or your preferred name)
4. Make it public (required for free GitHub Pages)
5. Do not initialize with README, .gitignore, or license (since you already have these)
6. Click "Create repository"

### 2. Push Your Code

```bash
git remote add origin https://github.com/your-username/interactive_portifolio.git
git branch -M main
git push -u origin main
```

### 3. Build and Deploy

```bash
# Build for web with correct base href
flutter build web --base-href /interactive_portifolio/

# Copy build files to a deployment branch
git checkout -b gh-pages
cp -r build/web/* .
git add .
git commit -m "Deploy to GitHub Pages"
git push origin gh-pages
```

### 4. Enable GitHub Pages

1. Go to your repository on GitHub
2. Click "Settings" tab
3. Scroll down to "Pages" section
4. Under "Source", select "Deploy from a branch"
5. Choose "gh-pages" branch and "/ (root)" folder
6. Click "Save"

Your portfolio will be available at: `https://your-username.github.io/interactive_portifolio/`

**Note**: It may take a few minutes for the site to be live.

## Customization Guide

### Modifying Content

1. **Hero Section**: Edit `lib/widgets/hero_section.dart`
   - Update name, title, and tagline
   - Modify animations and styling

2. **Skills Section**: Edit `lib/widgets/skills_section.dart`
   - Add or remove skills
   - Adjust skill levels and categories

3. **About Section**: Edit `lib/widgets/about_section.dart`
   - Update personal information and bio

4. **Projects Section**: Edit `lib/widgets/projects_section.dart`
   - Add new projects with descriptions
   - Include project links and technologies used

5. **Experience Section**: Edit `lib/widgets/experience_section.dart`
   - Update work experience timeline
   - Add new positions or achievements

6. **Contact Section**: Edit `lib/widgets/contact_section.dart`
   - Modify contact form fields
   - Update social media links

### Styling Changes

- Main theme and colors: Edit `lib/main.dart`
- Global styles: Check `pubspec.yaml` for dependencies
- Web-specific configurations: Edit `web/index.html`

### Adding New Sections

1. Create a new widget file in `lib/widgets/`
2. Import and add it to the main layout in `lib/main.dart`
3. Update navigation if needed

## Troubleshooting

### Common Issues

**Flutter Doctor Errors**:
- Ensure all prerequisites are installed
- Run `flutter doctor --android-licenses` if Android issues occur
- Update Flutter: `flutter upgrade`

**Build Failures**:
- Clear build cache: `flutter clean`
- Delete `pubspec.lock` and run `flutter pub get`
- Check for dependency conflicts in `pubspec.yaml`

**Web Build Issues**:
- Ensure you're using Flutter's web support: `flutter config --enable-web`
- For base href issues, verify the `--base-href` flag in build command

**GitHub Pages Not Loading**:
- Wait 5-10 minutes after deployment
- Check repository settings for correct branch and folder
- Verify base href matches your repository name
- Clear browser cache or try incognito mode

**Local Server Not Starting**:
- Kill any existing processes on port 8080
- Try a different port: `flutter run -d web-server --web-port=3000`

### Getting Help

- [Flutter Documentation](https://flutter.dev/docs)
- [Flutter Community](https://flutter.dev/community)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- Check existing issues in the repository

---

Built with ❤️ using Flutter. Ready to showcase your portfolio to the world!
