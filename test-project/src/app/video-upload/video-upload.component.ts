import { Component } from '@angular/core';
import { VideoService } from '../video.service';

@Component({
    selector: 'app-video-upload',
    templateUrl: './video-upload.component.html'
})
export class VideoUploadComponent {
    title: string = '';
    description: string = '';
    file: File | null = null;

    constructor(private videoService: VideoService) {}

    onFileSelected(event: any) {
        this.file = event.target.files[0];
    }

    onUpload() {
        if (this.file) {
            const formData = new FormData();
            formData.append('title', this.title);
            formData.append('description', this.description);
            formData.append('file', this.file);

            this.videoService.uploadVideo(formData).subscribe(response => {
                console.log('Video uploaded:', response);
            });
        }
    }
}
