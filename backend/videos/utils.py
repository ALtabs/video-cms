import os
import json
import tempfile
from googleapiclient.discovery import build
from google.oauth2 import service_account
from googleapiclient.http import MediaFileUpload
from dotenv import load_dotenv

load_dotenv()

def upload_file_to_drive(file_name, file):
    credentials_info = json.loads(os.environ['GOOGLE_DRIVE_CREDENTIALS'])
    credentials = service_account.Credentials.from_service_account_info(
        credentials_info
    )
    folder_id = "1VYx1SXoMpD-7JaL_vHMOT7NDyDcQXI2i"
    
    drive_service = build('drive', 'v3', credentials=credentials)

    # Create a temporary file
    with tempfile.NamedTemporaryFile(delete=True) as temp_file:
        # Write the content of the InMemoryUploadedFile to the temp file
        for chunk in file.chunks():
            temp_file.write(chunk)
        temp_file.flush()

        file_metadata = {
            'name': file_name,
            'mimeType': 'video/mp4',
            'parents': [folder_id]
        }

        # Upload the file using the temp file path
        media = MediaFileUpload(temp_file.name, mimetype='video/mp4')
        uploaded_file = drive_service.files().create(body=file_metadata, media_body=media, fields='id, webContentLink').execute()
        

        file_id = uploaded_file.get('id')
        drive_service.permissions().create(
            fileId=file_id,
            body={'role': 'reader', 'type': 'anyone'},
            fields='id'
        ).execute()
        
    return f"https://drive.google.com/uc?id={file_id}"