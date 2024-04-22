# Book selling website using Django

## Replace your database 
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': '', # your database name
        'USER': '', # your username 
        'PASSWORD': '', # your password
        'HOST': 'localhost', # I assume you are using localhost
        'PORT': '3306', # I assume you are using port 3306
    }
}
```

## Using the sql script `book_shop.sql` to create the database and add mock data
Please read the `book_shop.sql` carefully before running it. You need to change the database name to your database name.

## Install the required packages
```bash
pip install -r requirements.txt
```