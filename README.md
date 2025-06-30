# Rails Docker Project

This is a Ruby on Rails application that can be run using Docker and Dev Containers.

## Development with Dev Container

This project supports development using VS Code Dev Containers, which provides a consistent development environment.

### Prerequisites

- Docker and Docker Compose installed
- Visual Studio Code with the Dev Containers extension

### Getting Started with Dev Container

1. Clone this repository
2. Open the project in VS Code
3. When prompted, click "Reopen in Container" or use the Command Palette:
   - Press `F1` or `Ctrl+Shift+P` (Windows/Linux) / `Cmd+Shift+P` (Mac)
   - Type "Dev Containers: Reopen in Container"
   - Press Enter

4. VS Code will build the container and set up the development environment
5. Once the container is ready, open a terminal in VS Code and run:
   ```bash
   bin/setup
   ```

6. Start the Rails server:
   ```bash
   bin/rails server
   ```

The application will be available at http://localhost:3000

### Available VS Code Tasks

This project includes several pre-configured VS Code tasks:

- **Rails Server**: Start the Rails development server
- **Rails Console**: Open Rails console
- **Rails Test**: Run the test suite
- **Bundle Install**: Install Ruby gems
- **Database Setup**: Set up the database
- **Database Migrate**: Run database migrations

Access these tasks via:
- `Ctrl+Shift+P` (Windows/Linux) / `Cmd+Shift+P` (Mac)
- Type "Tasks: Run Task"
- Select the desired task

## Traditional Development Setup

Things you may want to cover:

* Ruby version: 3.4.3

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
