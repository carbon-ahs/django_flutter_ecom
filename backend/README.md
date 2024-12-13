# Django ECommerce Project.

## Introduction
Its a E Commerce site.

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
1. Clone this repository
2. Navigate to the project directory: `cd backend`
3. Create a virtual environment: `python -m venv .venv`
4. Activate the virtual environment:
   - On Windows: `.\.venv\Scripts\activate`
   - On macOS and Linux: `source env/bin/activate`
5. Install dependencies: `pip install -r requirements.txt`
6. Make migrations: `python manage.py makemigrations`
7. Apply migrations: `python manage.py migrate`
8. Create a superuser: `python manage.py createsuperuser`
9. Run the development server: `python manage.py runserver` for local testing
10. If you want to run with any forntend client `python manage.py runserver 0.0.0.0:8000` 
    then base URL will be <your_local_ip>:8000
11. To find local ip, go to cmd and `ipconfig` 
    ```
    Wireless LAN adapter Wi-Fi:
    Connection-specific DNS Suffix  . :
    Link-local IPv6 Address . . . . . : fe80::ac0e:1202:3c22:afca%6
    IPv4 Address. . . . . . . . . . . : 192.168.31.25 # this should be your local ip
    Subnet Mask . . . . . . . . . . . : 255.255.255.0
    Default Gateway . . . . . . . . . : 192.168.31.1```
  

## Acknowledgments
- [Django](https://www.djangoproject.com/) - The web framework for perfectionists with deadlines.
- [Python](https://www.python.org/) - The programming language that powers the project.
- [Font Awesome](https://fontawesome.com/) - Icon library.

## Contact
For any inquiries or feedback, please contact `shehanuk.ahsan@gmail.com` .
