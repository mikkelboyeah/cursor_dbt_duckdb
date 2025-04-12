@echo off
REM Setup script for Windows

REM Create tools directory
mkdir .tools 2>nul

REM Download uv binary for Windows
curl -LsSf https://github.com/astral-sh/uv/releases/latest/download/uv-x86_64-pc-windows-msvc.zip -o .tools\uv.zip
powershell -Command "Expand-Archive -Force .tools\uv.zip -DestinationPath .tools"
del .tools\uv.zip

REM Create a project-local virtual environment using the downloaded uv
.tools\uv.exe venv .venv

REM Install dependencies using uv
.tools\uv.exe pip install -r requirements.txt

REM Create data directory for DuckDB
mkdir dbt_project\data 2>nul

echo.
echo ✅ Setup complete! Run the following to activate the environment:
echo.
echo    .venv\Scripts\activate
echo.
echo Then cd into the dbt project:
echo.
echo    cd dbt_project
echo    dbt run
echo. 