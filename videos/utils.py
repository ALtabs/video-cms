import os
import json
import tempfile
from moviepy.editor import VideoFileClip
from googleapiclient.discovery import build
from google.oauth2 import service_account
from googleapiclient.http import MediaFileUpload
from dotenv import load_dotenv
from PIL import Image
import io

load_dotenv()

def upload_file_to_drive(file_name, file):
    # Load credentials from environment variable
    credentials_info = json.loads(os.environ['GOOGLE_DRIVE_CREDENTIALS'])
    credentials = service_account.Credentials.from_service_account_info(
        credentials_info
    )
    folder_id = "1VYx1SXoMpD-7JaL_vHMOT7NDyDcQXI2i"  # Your Google Drive folder ID
    
    drive_service = build('drive', 'v3', credentials=credentials)

    with tempfile.NamedTemporaryFile(delete=True) as temp_file:

        for chunk in file.chunks():
            temp_file.write(chunk)
        temp_file.flush()

        # File metadata for the upload
        file_metadata = {
            'name': file_name,
            'mimeType': 'video/mp4',
            'parents': [folder_id]
        }

        media = MediaFileUpload(temp_file.name, mimetype='video/mp4')
        uploaded_file = drive_service.files().create(
            body=file_metadata,
            media_body=media,
            fields='id, webContentLink'
        ).execute()


        file_id = uploaded_file.get('id')
        thumbnail_url = generate_thumbnail(temp_file.name, drive_service, folder_id, file_id)
        
        # Set permissions to make the file publicly accessible
        drive_service.permissions().create(
            fileId=file_id,
            body={'role': 'reader', 'type': 'anyone'},
            fields='id'
        ).execute()

        # Set permissions for the parent folder to make it publicly accessible
        drive_service.permissions().create(
            fileId=folder_id,
            body={'role': 'reader', 'type': 'anyone'},
            fields='id'
        ).execute()


    return {
        'video_url': f"https://drive.google.com/uc?id={file_id}",
        'thumbnail_url': thumbnail_url
    }


def generate_thumbnail(video_path, drive_service, folder_id, video_id):
    with VideoFileClip(video_path) as video:
        thumbnail_path = tempfile.NamedTemporaryFile(suffix='.jpg', delete=False)
        video.save_frame(thumbnail_path.name, t=1)
        thumbnail_file_metadata = {
            'name': f"{video_id}-thumbnail.jpg",
            'mimeType': 'image/jpeg',
            'parents': [folder_id]
        }

        media = MediaFileUpload(thumbnail_path.name, mimetype='image/jpeg')
        uploaded_thumbnail = drive_service.files().create(body=thumbnail_file_metadata, media_body=media, fields='id').execute()

        # Set the thumbnail's permission to be publicly accessible
        thumbnail_id = uploaded_thumbnail.get('id')
        drive_service.permissions().create(
            fileId=thumbnail_id,
            body={'role': 'reader', 'type': 'anyone'},
            fields='id'
        ).execute()

        os.remove(thumbnail_path.name)

    return f"https://drive.google.com/uc?id={thumbnail_id}"