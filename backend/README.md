# Django Boilerplate Project

## Introduction
This is a boilerplate Django project that serves as a foundation for building web applications using Django, a high-level Python web framework. It is pre-configured with some basic settings, file structure, and dependencies to help you kickstart your project development.

## Features
- Django version: 4.0
- Python version: 3.8
- Pre-configured settings for development and production environments.
- Basic file structure including:
  - `django_project/`: Directory for your Django applications.
  - `static/`: Directory for static files such as CSS, JavaScript, and images.
  - `templates/`: Directory for HTML templates.
  - `media/`: Directory for user-uploaded files.
  - `requirements.txt`: File listing all project dependencies.
- Gitignore file to ignore commonly ignored files and directories.
- README file to help you get started.

## Setup Instructions
1. Clone this repository: `git clone https://github.com/carbon-ahs/django_placeholderProject.git`
2. Navigate to the project directory: `cd django_placeholderProject`
3. Create a virtual environment: `python -m venv .venv`
4. Activate the virtual environment:
   - On Windows: `.\.venv\Scripts\activate`
   - On macOS and Linux: `source env/bin/activate`
5. Install dependencies: `pip install -r requirements.txt`
6. Make migrations: `python manage.py makemigrations`
7. Apply migrations: `python manage.py migrate`
8. Create a superuser: `python manage.py createsuperuser`
9. Run the development server: `python manage.py runserver`

## Acknowledgments
- [Django](https://www.djangoproject.com/) - The web framework for perfectionists with deadlines.
- [Python](https://www.python.org/) - The programming language that powers the project.
- [Font Awesome](https://fontawesome.com/) - Icon library.

## Contact
For any inquiries or feedback, please contact `shehanuk.ahsan@gmail.com` .
