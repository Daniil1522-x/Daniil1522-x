@echo off
chcp 65001 >nul
setlocal

echo.
echo ==========================================
echo       Daniil1522-x GitHub Profile
echo ==========================================
echo.

REM Создание директорий
echo [1/5] Creating directories...

if not exist "assets" mkdir "assets"
if not exist ".github" mkdir ".github"
if not exist ".github\workflows" mkdir ".github\workflows"

REM Перемещение баннера
echo [2/5] Installing banner...

if exist "banner.png" (
    move /Y "banner.png" "assets\banner.png" >nul
    echo Banner installed: assets\banner.png
) else (
    echo WARNING: banner.png not found!
    echo Put banner.png into the project root and run setup.bat again.
)

REM Создание snake workflow
echo [3/5] Creating GitHub Snake workflow...

(
echo name: Generate Contribution Snake
echo.
echo on:
echo   schedule:
echo     - cron: "0 0 * * *"
echo   workflow_dispatch:
echo.
echo permissions:
echo   contents: write
echo.
echo jobs:
echo   generate:
echo     runs-on: ubuntu-latest
echo.
echo     steps:
echo       - name: Generate snake
echo         uses: Platane/snk@v3
echo         with:
echo           github_user_name: Daniil1522-x
echo           outputs: ^|
echo             dist/github-contribution-grid-snake.svg
echo             dist/github-contribution-grid-snake-dark.svg?palette=github-dark
echo.
echo       - name: Deploy snake
echo         uses: crazy-max/ghaction-github-pages@v4
echo         with:
echo           build_dir: dist
echo         env:
echo           GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
) > ".github\workflows\snake.yml"

REM Создание README
echo [4/5] Creating README.md...

(
echo # Daniil1522-x
echo.
echo ^<p align="center"^>
echo   ^<img src="./assets/banner.png" alt="Daniil1522-x GitHub Banner" width="100%%" /^>
echo ^</p^>
echo.
echo ^<h2 align="center"^>BUILD ^&bull; LEARN ^&bull; CREATE^</h2^>
echo.
echo ^<p align="center"^>
echo   Developer focused on Android, Backend, DevOps and AI.
echo ^</p^>
echo.
echo ---
echo.
echo ## ⚡ About Me
echo.
echo - 🔥 Building software and learning every day
echo - 📱 Android / Kotlin development
echo - ⚙️ Backend development
echo - 🐳 Docker / DevOps
echo - 🤖 AI / LLM
echo - 🧠 Always learning something new
echo.
echo ## 🛠️ Tech Stack
echo.
echo ^| Area ^| Technologies ^|
echo ^|------^|--------------^|
echo ^| Language ^| Kotlin, Python, Java, JavaScript ^|
echo ^| Android ^| Kotlin, Android SDK ^|
echo ^| Backend ^| Django, FastAPI, Flask ^|
echo ^| Databases ^| PostgreSQL, SQLite, SQL ^|
echo ^| DevOps ^| Linux, Docker, Git, CI/CD ^|
echo ^| AI ^| LLM, Ollama, Machine Learning ^|
echo.
echo ---
echo.
echo ## 🚀 Featured Projects
echo.
echo ### 📱 AndroidUI
echo Kotlin Android project.
echo.
echo ### 🚀 AppProjectOne
echo Kotlin application project.
echo.
echo ### 🧠 IntentsApp
echo Android / Kotlin project.
echo.
echo ---
echo.
echo ## 🐍 Contribution Snake
echo.
echo ^<p align="center"^>
echo   ^<img src="https://raw.githubusercontent.com/Daniil1522-x/Daniil1522-x/output/github-contribution-grid-snake-dark.svg" alt="GitHub Contribution Snake" /^>
echo ^</p^>
echo.
echo ---
echo.
echo ## 💻 Developer Philosophy
echo.
echo ^```text
echo Code.
echo Learn.
echo Build.
echo Break.
echo Fix.
echo Repeat.
echo ^```
echo.
echo ^<p align="center"^>
echo   ^<b^>const developer = { passion: true, code: "endless", mission: "make impact" };^</b^>
echo ^</p^>
echo.
echo ---
echo.
echo ^<p align="center"^>
echo   ^i^>GitHub profile powered by curiosity, caffeine and code.^</i^>
echo ^</p^>
) > "README.md"

REM Git status
echo [5/5] Checking Git repository...

if not exist ".git" (
    echo Initializing Git repository...
    git init
)

git add .

echo.
echo ==========================================
echo             DONE!
echo ==========================================
echo.
echo Created:
echo   assets/banner.png
echo   .github/workflows/snake.yml
echo   README.md
echo.
echo Next commands:
echo.
echo   git add .
echo   git commit -m "Create GitHub profile"
echo   git branch -M main
echo   git remote add origin https://github.com/Daniil1522-x/Daniil1522-x.git
echo   git push -u origin main
echo.
pause