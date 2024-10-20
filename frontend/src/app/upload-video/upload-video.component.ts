import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { NavbarComponent } from '../navbar/navbar.component';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { VideoService } from '../services/video.service';

@Component({
  selector: 'app-upload-video',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule, NavbarComponent],
  templateUrl: './upload-video.component.html',
  styleUrls: ['./upload-video.component.css'],
})
export class UploadVideoComponent {
  uploadForm: FormGroup;
  private apiUrl = 'https://cms-backend-sp1z.onrender.com/api/videos/';

  constructor(
    private fb: FormBuilder,
    private router: Router,
    private http: HttpClient,
    private videoService: VideoService,
  ) {
    this.uploadForm = this.fb.group({
      title: ['', Validators.required],
      description: [''],
      file: [null, Validators.required],
    });
  }

  onSubmit() {
    if (this.uploadForm.invalid) {
      return;
    }

    const token = localStorage.getItem('access_token');
    const headers = { Authorization: `Bearer ${token}` };

    const formData = new FormData();
    formData.append('title', this.uploadForm.value.title);
    formData.append('description', this.uploadForm.value.description);
    formData.append('video_file', this.uploadForm.value.file);
    this.videoService.uploadVideo(formData).subscribe(
      (response: any) => {
        this.router.navigate(['/home']);
      },
      (error) => {
        console.error('Upload failed', error);
      }
    )
  }

  onFileChange(event: any) {
    const file = event.target.files[0];
    this.uploadForm.patchValue({ file });
  }
}
