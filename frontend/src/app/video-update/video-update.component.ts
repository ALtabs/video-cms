import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { VideoService } from '../services/video.service';
import { CommonModule } from '@angular/common';
import { NavbarComponent } from '../navbar/navbar.component';

@Component({
  selector: 'app-video-update',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule, NavbarComponent],
  templateUrl: './video-update.component.html',
  styleUrl: './video-update.component.css'
})
export class VideoUpdateComponent implements OnInit {
  videoForm!: FormGroup;
  selectedFile: File | null = null;
  originalFormData: any;
  videoId!: number;

  constructor(
    private fb: FormBuilder,
    private route: ActivatedRoute,
    private router: Router,
    private videoService: VideoService
  ) {}

  ngOnInit(): void {
    // Initialize the form
    this.videoForm = this.fb.group({
      title: ['', Validators.required],
      description: [''],
      file: [null],
    });

    // Get the video ID from the route
    this.videoId = +this.route.snapshot.paramMap.get('id')!;

    // Fetch the video data and populate the form
    this.videoService.getVideoById(this.videoId).subscribe((video) => {
      this.videoForm.patchValue({
        title: video.title,
        description: video.description,
      });

      // Store the original data for change detection
      this.originalFormData = this.videoForm.value;
    });
  }

  // Function to compare the current form values to the original data
  checkIfChanged(currentFormData: any): boolean {
    return JSON.stringify(this.originalFormData) !== JSON.stringify(currentFormData);
  }

  // Handles file input change
  onFileChange(event: any): void {
    const file = event.target.files[0];
    if (file) {
      this.selectedFile = file;
      this.videoForm.patchValue({
        video_file: file,
      });
    }
  }

  // Handle form submission
  onSubmit(): void {
    if (this.videoForm.valid) {
      const formData = new FormData();
      formData.append('title', this.videoForm.get('title')?.value);
      formData.append('description', this.videoForm.get('description')?.value);

      if (this.selectedFile) {
        formData.append('video_file', this.selectedFile);
      }

      // Call the update service
      this.videoService.updateVideo(this.videoId, formData).subscribe(
        (response) => {
          this.router.navigate(['/home']);
        },
        (error) => {
          console.error('Error updating video', error);
        }
      );
    }
  }

  // Navigate back to home on cancel
  navigateToHome(): void {
    this.router.navigate(['/home']);
  }
}
