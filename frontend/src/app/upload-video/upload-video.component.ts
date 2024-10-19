import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { NavbarComponent } from '../navbar/navbar.component';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

@Component({
  selector: 'app-upload-video',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule, NavbarComponent],
  templateUrl: './upload-video.component.html',
  styleUrls: ['./upload-video.component.css'],
})
export class UploadVideoComponent {
  uploadForm: FormGroup;

  constructor(private fb: FormBuilder, private router: Router, private http: HttpClient) {
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

    const formData = new FormData();
    formData.append('title', this.uploadForm.value.title);
    formData.append('description', this.uploadForm.value.description);
    formData.append('video_file', this.uploadForm.value.file);

    this.http.post('https://video-cms.onrender.com/api/videos/', formData)
        .subscribe(
            (response: any) => {
                this.router.navigate(['/login']);
            },
            (error) => {
                console.error('Signup failed', error);
            }

    )
  }

  // Method to capture file input
  onFileChange(event: any) {
    const file = event.target.files[0];
    this.uploadForm.patchValue({ file });
  }
}
