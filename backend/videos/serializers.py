from django.contrib.auth.models import User
from django.contrib.auth import authenticate
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
        user.set_password(validated_data['password'])
        user.save()
        return user

class LoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()

    def validate(self, data):
        user = authenticate(**data)
        if user is None:
            raise serializers.ValidationError("Invalid username or password.")
        return data
 
class VideoSerializer(serializers.ModelSerializer):
    uploader_username = serializers.CharField(source='uploader.username', read_only=True)

    class Meta:
        model = Video
        fields = ['id', 'title', 'description', 'video_file_url', 'uploader_username', 'created_at', 'thumbnail_url']
        read_only_fields = ['uploader', 'video_file_url'] 

    def create(self, validated_data):
        video_file = self.context['request'].data.get('video_file', None)

        if video_file:
            video_file_url = upload_file_to_drive(video_file.name, video_file)
            validated_data['video_file_url'] = video_file_url['video_url']
            validated_data['thumbnail_url'] = video_file_url['thumbnail_url']
        else:
            raise serializers.ValidationError("Video file is required.")

        # Assign the uploader from the request user
        request = self.context.get('request')
        validated_data['uploader'] = request.user

        return super().create(validated_data)