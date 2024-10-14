from googleapiclient.discovery import build
from googleapiclient.http import MediaFileUpload
from google.oauth2.credentials import Credentials

def upload_to_google_drive(file_path):
    credentials_json = os.getenv('GOOGLE_DRIVE_CREDENTIALS')
    creds = Credentials.from_authorized_user(credentials_json)
    service = build('drive', 'v3', credentials=creds)
    file_metadata = {'name': file_path.split('/')[-1]}
    media = MediaFileUpload(file_path, mimetype='video/mp4')
    file = service.files().create(body=file_metadata, media_body=media, fields='id').execute()
    return file.get('id')