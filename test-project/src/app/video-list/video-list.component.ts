import { Component, OnInit } from '@angular/core';
import { VideoService } from '../video.service';
import { Video } from '../video.model';

@Component({
    selector: 'app-video-list',
    templateUrl: './video-list.component.html'
})
export class VideoListComponent implements OnInit {
    videos: Video[] = [];

    constructor(private videoService: VideoService) {}

    ngOnInit() {
        this.videoService.getVideos().subscribe(data => {
            this.videos = data;
        });
    }
}
