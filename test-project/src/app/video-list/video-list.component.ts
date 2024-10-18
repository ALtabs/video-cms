import { Component, AfterViewInit, ViewChild, ElementRef, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NavbarComponent } from '../navbar/navbar.component'; // Import NavbarComponent
import videojs from 'video.js';

export interface Video {
  id: number;
  title: string;
  file: string;
  showDropdown?: boolean; // Optional property to manage dropdown visibility
}

@Component({
  selector: 'app-video-list',
  templateUrl: './video-list.component.html',
  styleUrls: ['./video-list.component.css'],
  standalone: true,
  imports: [CommonModule, NavbarComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class VideoListComponent implements AfterViewInit {
  videos: Video[] = [
    { id: 1, title: 'Video 1', file: 'assets/video1.mp4' },
    { id: 2, title: 'Video 2', file: 'assets/video2.mp4' },
    { id: 3, title: 'Video 3', file: 'assets/video3.mp4' },
  ];

  selectedVideo: Video | null = null;


  @ViewChild('videoPlayer', { static: false }) videoPlayer!: ElementRef<HTMLVideoElement>;

  ngAfterViewInit() {
    if (this.selectedVideo) {
      this.initPlayer(this.selectedVideo.file);
    }
  }

  selectVideo(video: Video) {
    this.selectedVideo = video;
    this.initPlayer(video.file);
  }

  initPlayer(videoSrc: string) {
    if (this.videoPlayer) {
      const player = videojs(this.videoPlayer.nativeElement);
      player.src({ src: videoSrc, type: 'video/mp4' });
      player.play();
    }
  }

  toggleDropdown(videoId: number) {
    const video = this.videos.find(v => v.id === videoId);
    if (video) {
      video.showDropdown = !video.showDropdown;
    }
  }

  editVideo(video: Video) {
    console.log(`Edit video: ${video.title}`);
    // Implement edit logic here
  }

  deleteVideo(video: Video) {
    console.log(`Delete video: ${video.title}`);
    // Implement delete logic here
  }
}
