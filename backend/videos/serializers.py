from django.contrib.auth.models import User
from rest_framework import serializers

from .utils import upload_file_to_drive
from .models import Video

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'password']
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        user = User(**validated_data)
        user.set_password(validated_data['password'])  # Hash the password
        user.save()
        return user
    
class VideoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Video
        fields = ['id', 'title', 'description', 'video_file_url', 'uploader']

    def create(self, validated_data):
        video_file = validated_data.pop('video_file', None)
        
        # Upload the video file to Google Drive
        if video_file:
            video_file_url = upload_file_to_drive(video_file.name, video_file.path)
            validated_data['video_file_url'] = video_file_url

        # Automatically set the uploader to the current user
        request = self.context.get('request')
        validated_data['uploader'] = request.user
        
        return super().create(validated_data)