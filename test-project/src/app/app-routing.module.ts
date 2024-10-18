import { Routes } from '@angular/router';
import { VideoListComponent } from './video-list/video-list.component';
import { VideoUploadComponent } from './video-upload/video-upload.component';
import { SignupComponent } from './signup/signup.component';
import { LoginComponent } from './login/login.component';

const routes: Routes = [
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: 'videos-list', component: VideoListComponent },
  { path: 'upload', component: VideoUploadComponent },
  { path: 'signup', component: SignupComponent},
  { path: 'login', component: LoginComponent },
];

