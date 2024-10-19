import { Component, OnInit, CUSTOM_ELEMENTS_SCHEMA, AfterViewInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { NavbarComponent } from '../navbar/navbar.component';
import { VideoService } from '../services/video.service';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { Video } from '../video.model';
import videojs from 'video.js';
import { Router } from '@angular/router';

@Component({
  selector: 'app-homepage',
  standalone: true,
  imports: [CommonModule, RouterModule, NavbarComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  styleUrls: ['./homepage.component.css'],
  templateUrl: './homepage.component.html',
})
export class HomepageComponent implements OnInit, AfterViewInit {
  videos: Video[] = [];
  selectedVideo: Video | null = null;
  private players: any[] = [];
  hasVideos: boolean = false;

  constructor(private videoService: VideoService, private router: Router, private sanitizer: DomSanitizer) {}

  ngOnInit() {
    this.fetchVideos();
  }

  fetchVideos() {
    this.videoService.getVideos().subscribe(
      (data: Video[]) => {
        this.videos = data;
        this.hasVideos = this.videos.length > 0;
      },
      (error) => {
        console.error('Error fetching videos:', error);
      }
    );
  }

  ngAfterViewInit() {
    this.videos.forEach((video, index) => {
        const videoUrl = `https://drive.google.com/file/d/${this.extractFileId(video.video_file_url)}/preview`;
        const playerId = `videoPlayer${index}`;
        const videoElement = document.getElementById(playerId) as HTMLVideoElement;

        if (videoElement) {
            const player = videojs(videoElement, {
                sources: [{
                    src: videoUrl,
                    type: 'video/mp4'
                }]
            });

            this.players.push(player);
        }
    });
}


ngOnDestroy() {
  this.players.forEach(player => player.dispose());
}

getEmbedUrl(url: string): SafeResourceUrl | null {
    const fileId = this.extractFileId(url);
    if (fileId) {
        const embedUrl = `https://drive.google.com/file/d/${fileId}/preview`;
        return this.sanitizer.bypassSecurityTrustResourceUrl(embedUrl);
    }
    console.warn('Invalid URL or file ID not found:', url);
    return null;
}

getEmbedThumbnail(url: string): SafeResourceUrl | null {
    const fileId = this.extractFileId(url);
    if (fileId) {
        const embedUrl = `https://drive.google.com/thumbnail?id=${fileId}`;
        return this.sanitizer.bypassSecurityTrustResourceUrl(embedUrl);
    }
    console.warn('Invalid URL or file ID not found:', url);
    return null;
}



selectVideo(video: Video) {
  this.selectedVideo = video;
}


  editVideo(video: Video) {
    this.router.navigate(['/update', video.id]);
  }

  deleteVideo(video: Video) {
    const index = this.videos.indexOf(video);
    if (index > -1) {
      this.videos.splice(index, 1);
      this.videoService.deleteVideo(video.id).subscribe(() => {
        this.selectedVideo = null;
        this.router.navigate(['home']);
      });
    }
  }

  extractFileId(url: string): string | null {
    let match;
    match = url.match(/[?&]id=([^&]+)/);
    if (match) {
        return match[1];
    }
    return null;
  }
}
