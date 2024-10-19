// src/app/services/video.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class VideoService {
  private apiUrl = 'https://cms-backend-sp1z.onrender.com/api/videos/';

  constructor(private http: HttpClient) {}

  // Get the list of videos
  getVideos(): Observable<any[]> {
    const token = localStorage.getItem('access_token');
    const headers = { Authorization: `Bearer ${token}` };
    return this.http.get<any[]>(this.apiUrl, { headers });
  }

  // Upload a new video
  uploadVideo(formData: FormData): Observable<any> {
    return this.http.post(this.apiUrl, formData);
  }
}
