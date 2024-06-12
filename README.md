Overview
This is a Task Management web application built using Ruby on Rails, with the PostgreSQL as the database. The application allows users to authenticate themselves to create tasks, manage task states (Backlog, In-progress, Done), set deadlines for tasks, and receive email alerts if a task is not completed before the deadline.

Features
User Authentication: Users can sign up, log in, and log out to create and manage tasks.
Task States: Tasks can be in one of three states: Backlog, In-progress, or Done. Users can update the status of tasks accordingly.
Deadline: Each task has a defined deadline.
Email Alerts: If a task is marked as not done before the deadline, the system sends email alerts 1 day and 1 hour before the deadline.

**README**: Detailed README file explaining the code structure and usage.
Installation
Clone the repository: git clone git@github.com:Sunil113/amaha_task.git
Navigate to the project directory: cd task-management-app
Install dependencies: bundle install
Configure the database: Modify config/database.yml to specify your preferred database (MongoDB/MySQL/PostgreSQL) configuration.
Run migrations: rails db:migrate
Start the Rails server: rails server

**Usage**
Sign up or log in to access the task management dashboard.
Create new tasks with deadlines and assign them to appropriate states.
Update task status as work progresses.
Receive email alerts if a task is not completed before the deadline.

