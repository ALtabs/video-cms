// src/app/services/video.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class VideoService {
  private apiUrl = 'https://cms-backend-sp1z.onrender.com/api/videos/';
  private token : String;
  private userId: number;

  constructor(private http: HttpClient) {
    this.token = localStorage.getItem('access_token') || '';
    this.userId = parseInt(localStorage.getItem('user_id') || '0', 10)
  }

  // Get all videos
  getVideos(): Observable<any[]> {
    const headers = { Authorization: `Bearer ${this.token}` };
    const url = `${this.apiUrl}?uploader_id=${this.userId}`;

    return this.http.get<any[]>(url, { headers });
  }

  // Upload a new video
  uploadVideo(formData: FormData): Observable<any> {
    const headers = { Authorization: `Bearer ${this.token}` };
    return this.http.post(this.apiUrl, formData, { headers });
  }

  updateVideo(id: number, video: any): Observable<any> {
    const headers = { Authorization: `Bearer ${this.token}` };
    return this.http.put(`${this.apiUrl}${id}/`, video, { headers });
  }

  deleteVideo(id: number): Observable<any> {
    const headers = { Authorization: `Bearer ${this.token}` };
    return this.http.delete(`${this.apiUrl}${id}/`, { headers });
  }

  getVideoById(id: number): Observable<any> {
    const token = localStorage.getItem('access_token');
    const headers = { Authorization: `Bearer ${token}` };
    return this.http.get(`${this.apiUrl}${id}/`, { headers });
  }
}
