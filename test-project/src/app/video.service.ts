import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { Video } from './video.model'; // Create a model for Video

@Injectable({
    providedIn: 'root'
})
export class VideoService {
    private apiUrl = 'http://localhost:8080/api/videos/';
    constructor(private http: HttpClient) { }

    getVideos(): Observable<Video[]> {
      const token = localStorage.getItem('access_token');
      const headers = { Authorization: `Bearer ${token}` };
        return this.http.get<Video[]>(this.apiUrl, { headers });
    }

    uploadVideo(videoData: FormData): Observable<Video> {
        return this.http.post<Video>(this.apiUrl, videoData);
    }
}


