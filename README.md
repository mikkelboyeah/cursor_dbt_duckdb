# DBT with DuckDB Project

This project uses dbt (data build tool) with DuckDB as the underlying database.

## Setup

1. Clone this repository

2. Run the setup script to create a project-local environment:

   **On Linux/macOS**:
   ```
   chmod +x setup.sh
   ./setup.sh
   ```

   **On Windows**:
   ```
   setup.bat
   ```
   
   This will:
   - Download uv (a fast Python package installer) directly to the project
   - Create a virtual environment in `.venv/`
   - Install all required dependencies 
   - Set up the necessary directories

3. Activate the environment:

   **On Linux/macOS**:
   ```
   source .venv/bin/activate
   ```

   **On Windows**:
   ```
   .venv\Scripts\activate
   ```

4. Use the dbt project:
   ```
   cd dbt_duckdb_project
   dbt run  # This will run all models
   ```
   
## Project Structure

- `dbt_duckdb_project/` - Contains the dbt project
  - `models/` - SQL models
    - `staging/` - Initial data processing (materialized as views)
    - `intermediate/` - Transformed data (materialized as ephemeral)
    - `mart/` - Final business-ready data (materialized as tables)
  - `profiles.yml` - Connection profiles
  - `dbt_project.yml` - Project configuration
  - `data/` - DuckDB database will be created here
- `setup.sh` - Setup script for Linux/macOS
- `setup.bat` - Setup script for Windows
- `.tools/` - Contains local tools (like uv)
- `.venv/` - Python virtual environment

## Working with DuckDB

This project uses DuckDB as the database backend, which is a high-performance analytical database system that works with local files.

Benefits:
- No need for a database server
- Fast analytical queries
- Files can be versioned in git
- Simple setup and portability

## Common dbt Commands

- `dbt run` - Run all models
- `dbt run --select staging` - Run only staging models
- `dbt test` - Run tests
- `dbt docs generate` - Generate documentation
- `dbt docs serve` - Serve documentation locally

## Dependencies

Dependencies are managed through:
1. `requirements.txt` - Python package dependencies (installed with project-local uv)
2. `dbt_duckdb_project/packages.yml` - dbt packages (if needed) 