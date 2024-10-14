from rest_framework import viewsets
from .models import Video
from .serializers import VideoSerializer
from google.oauth2 import service_account
from googleapiclient.discovery import build

class VideoViewSet(viewsets.ModelViewSet):
    queryset = Video.objects.all()
    serializer_class = VideoSerializer

    def perform_create(self, serializer):
        # Logic for uploading to Google Drive and saving the URL
        # Use Google Drive API to upload the file
        pass