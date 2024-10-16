// import { Injectable } from '@angular/core';
// import { HttpClient } from '@angular/common/http';  // Import HttpClient

// @Injectable({
//   providedIn: 'root'
// })
// export class VideoService {

//   constructor(private http: HttpClient) { }  // Inject HttpClient

//   getVideos() {
//     return this.http.get('/api/videos');  // Example API call
//   }
// }

import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Video } from './video.model'; // Create a model for Video

@Injectable({
    providedIn: 'root'
})
export class VideoService {
    private apiUrl = 'http://localhost:8080/api/videos/';

    constructor(private http: HttpClient) { }

    getVideos(): Observable<Video[]> {
        return this.http.get<Video[]>(this.apiUrl);
    }

    uploadVideo(videoData: FormData): Observable<Video> {
        return this.http.post<Video>(this.apiUrl, videoData);
    }
}


