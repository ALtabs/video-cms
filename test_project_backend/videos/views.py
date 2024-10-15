import os
from django.shortcuts import render, redirect
from google.oauth2.credentials import Credentials
from googleapiclient.discovery import build
from googleapiclient.http import MediaFileUpload
from .forms import VideoUploadForm
from .models import Video
from django.conf import settings


# Load Google Drive credentials
def load_google_drive_service():
    creds = Credentials.from_authorized_user_file(settings.GOOGLE_DRIVE_CREDENTIALS_PATH)
    return build('drive', 'v3', credentials=creds)

# Upload a video to Google Drive
def upload_file_to_drive(service, file_path, mime_type):
    file_metadata = {
        'name': os.path.basename(file_path),
    }

    media = MediaFileUpload(file_path, mimetype=mime_type)

    uploaded_file = service.files().create(
        body=file_metadata,
        media_body=media,
        fields='id'
    ).execute()

    return uploaded_file.get('id')



# View for uploading videos
@api_view(['POST'])
def upload_video(request):
    if request.method == 'POST':
        form = VideoUploadForm(request.POST)
        if form.is_valid():
            video = form.save(commit=False)
            video.uploaded_by = request.user
            video.save()

            # Upload file to Google Drive
            file_path = '/path/to/your/video/file.mp4'  # Replace with the actual video file path
            mime_type = 'video/mp4'  # Update if necessary
            drive_service = load_google_drive_service()
            upload_file_to_drive(drive_service, file_path, mime_type)

            return redirect('video_list')
    else:
        form = VideoUploadForm()
    return render(request, 'video/upload.html', {'form': form})

# View for listing videos
@api_view(['GET'])
def video_list(request):
    videos = Video.objects.all()
    return render(request, 'video/video_list.html', {'videos': videos})


# @api_view(['POST'])
# def upload_video(request):
#     file = request.FILES['file']
#     title = request.data['title']
#     description = request.data['description']

#     # Save to Google Drive
#     file_id = upload_to_drive(file, title)

#     # Save metadata to DB
#     video = Video.objects.create(title=title, description=description, file_id=file_id)
#     return Response({"message": "Video uploaded successfully", "file_id": file_id})


# @api_view(['GET'])
# def list_videos(request):
#     videos = Video.objects.all()
#     data = [{"title": video.title, "description": video.description, "file_id": video.file_id} for video in videos]
#     return Response(data)