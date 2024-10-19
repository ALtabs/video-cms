#  rest_framework helpers
from django.shortcuts import render
from django.views import View
from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework import status
from rest_framework import generics, permissions
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken
# django helpers
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import authenticate
from django.contrib.auth.models import User

from .serializers import UserSerializer, VideoSerializer
from .models import Video
from django.http import JsonResponse


class VideoViewSet(viewsets.ModelViewSet):
    queryset = Video.objects.all()
    serializer_class = VideoSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_serializer_context(self):
        # Override to add the request to the context
        context = super().get_serializer_context()
        context.update({"request": self.request})
        return context
    
    def get_queryset(self):
        # Start with the base queryset
        queryset = super().get_queryset()

        # Get uploader_id from query parameters
        uploader_id = self.request.query_params.get('uploader_id', None)
        if uploader_id is not None:
            # Filter the queryset by uploader_id if provided
            queryset = queryset.filter(uploader_id=uploader_id)

        return queryset
    
class RegisterView(generics.CreateAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = [permissions.AllowAny]

class LoginView(generics.GenericAPIView):
    permission_classes = [permissions.AllowAny]
    
    def post(self, request, *args, **kwargs):
        username = request.data.get('username')
        password = request.data.get('password')
        user = authenticate(username=username, password=password)

        if user is not None:
            refresh = RefreshToken.for_user(user)
            return Response({
                'refresh': str(refresh),
                'access': str(refresh.access_token),
                'user_id': user.id
            })
        return Response({"detail": "Invalid credentials"}, status=status.HTTP_401_UNAUTHORIZED)


class KeepAliveView(View):
    def get(self, request, *args, **kwargs):
        return JsonResponse({'status': 'ok'})