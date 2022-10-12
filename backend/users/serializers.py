from rest_framework import serializers
from users.models import *
from rest_framework.validators import UniqueValidator
from django.core.exceptions import ValidationError
from drf_extra_fields.fields import Base64ImageField


class UserSerializer(serializers.ModelSerializer):
    name = serializers.CharField(required=True) 
    password = serializers.CharField(write_only=True,required=True,style={'input_type': 'password'})
    email = serializers.EmailField(required=True,validators=[UniqueValidator(queryset=User.objects.all())])
    photo = Base64ImageField(required=False)

    def validate_email(self, value):
        user = self.context['request'].user
        if User.objects.exclude(pk=user.pk).filter(email=value).exists():
            raise serializers.ValidationError({"email": "This email is already in use."})
        return value

    class Meta:
        model = User
        fields = ( 'id', 'name', 'email', 'password', 'photo')        
        extra_kwargs = {'password': {'write_only': True}}


class UserLoginSerializer(serializers.ModelSerializer):
    # to accept either username or email
    email = serializers.CharField(style={'placeholder': 'Enter your email'})
    password = serializers.CharField(
        write_only=True,
        required=True,
        style={'input_type': 'password', 'placeholder': "Enter your password"}
    )
    class Meta:
        model = User
        fields = (
            'email',
            'password',
        )
    def validate(self, data):
        
        email = data.get("email")
        password = data.get("password")

        if not email and password:
            raise ValidationError("email and password is required")
        try:
            user = User.objects.get(email=email)
        except User.DoesNotExist:
            raise ValidationError("This email does not exist")
        if user.password == password:
            data["id"] = user.id
            data["email"] = user.email
            data["name"] = user.name
            data["photo"] = user.photo

            return data;
        else:
            raise ValidationError("Invalid credentials")
