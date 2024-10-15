import os
import json
from googleapiclient.discovery import build
from google.oauth2 import service_account
from googleapiclient.http import MediaFileUpload
from dotenv import load_dotenv

load_dotenv()

def upload_file_to_drive(file_name, file_path):
    # Load Google Drive credentials from environment variable
    credentials_info = json.loads(os.environ['GOOGLE_DRIVE_CREDENTIALS'])
    credentials = service_account.Credentials.from_service_account_info(
        credentials_info
    )
    
    drive_service = build('drive', 'v3', credentials=credentials)

    # File metadata
    file_metadata = {
        'name': file_name,
        'mimeType': 'video/mp4'  # Adjust based on the file type you expect
    }

    # Upload the file
    media = MediaFileUpload(file_path, mimetype='video/mp4')  # Adjust based on the file type
    file = drive_service.files().create(body=file_metadata, media_body=media, fields='id, webContentLink').execute()
    
    return f"https://drive.google.com/uc?id={file.get('id')}"  # Returns the shareable link
