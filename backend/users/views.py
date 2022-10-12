from django.shortcuts import render
from .models import *
from .serializers import *
from rest_framework.views import APIView
from rest_framework import generics
from rest_framework.response import Response
from rest_framework import status, permissions




# Create your views here.
class RegisterUser(generics.CreateAPIView):
    # get method handler
    queryset = User.objects.all()
    serializer_class = UserSerializer

class Login(APIView):
    # get method handler
    serializer_class = UserLoginSerializer

    def post(self, request, format=None):
        serializer_class = UserLoginSerializer(data=request.data)
        if serializer_class.is_valid(raise_exception=True):
            return Response(
                {
                    #'UserDetails':serializer_class.data,
                    'name':serializer_class.validated_data['name'],
                    'email':serializer_class.validated_data['email'],
                    # 'photo':serializer_class.validated_data['photo'],
                    
                    'id':serializer_class.validated_data['id'],
                },
                # status=HTTP_200_OK
            )
        return Response(serializer_class.errors, status=HTTP_400_BAD_REQUEST)