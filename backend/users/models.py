from django.db import models

# Create your models here.
class User(models.Model):
    name = models.CharField(max_length=150, null=False)
    email = models.EmailField(verbose_name="email", max_length=150, unique=True)
    password = models.CharField(max_length=20, null=False)
    photo = models.ImageField(null=True)

    def __str__(self):
        return f"{self.id}"