MY AI MOVIE GENERATOR - STARTER PROJECT

WHAT THIS IS
This is a Flutter Android app starter interface. It includes:
- Movie prompt field
- Fixed 3-hour duration
- Language dropdown
- Planned feature list for video, voices, music and editing
- Honest status message explaining that generation is not connected yet

IMPORTANT
This starter does NOT generate a movie. It does not contain an AI video model,
voice service, music service, backend, or automatic video assembly. Those must
be built and connected separately. A 3-hour movie would be generated as many
short clips and assembled in the cloud. Free services cannot guarantee
unlimited 3-hour generation.

BUILD AN APK WITH GITHUB ACTIONS
1. Create a GitHub account and a new repository.
2. Upload the contents of this project to the repository (not the ZIP file itself).
3. Make sure the repository contains:
   - pubspec.yaml
   - lib/main.dart
   - .github/workflows/build-apk.yml
4. Open the repository's Actions tab.
5. Select "Build Android APK" and tap "Run workflow" if it has not started.
6. When the workflow finishes, open the run and download the artifact named
   "my-ai-movie-generator-apk".
7. Extract the downloaded artifact ZIP to get app-release.apk.
8. Install the APK on your Android phone. Android may ask you to allow installs
   from that source.

NOTE
Acode is a code editor. It does not compile Flutter apps by itself. You can use
Acode to edit lib/main.dart, but GitHub Actions does the APK build online.

NEXT DEVELOPMENT PHASE
A secure backend is needed to:
- Generate screenplay and scene plans
- Submit video generation jobs to a provider
- Generate speech and music
- Track long-running jobs
- Assemble clips, voices, music and subtitles into an MP4
- Store and deliver the final movie

Do not put secret API keys in lib/main.dart or in the Android APK.
