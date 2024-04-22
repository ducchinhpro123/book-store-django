from django.db import models


# Create your models here.
class Author(models.Model):
    name = models.CharField(max_length=100)
    bio = models.TextField()
    img_profile = models.ImageField(upload_to='author_images', blank=True, null=True)
    year_of_birth = models.IntegerField(null=True, blank=True)
    year_of_death = models.IntegerField(blank=True, null=True)

    def __str__(self):
        return self.name
