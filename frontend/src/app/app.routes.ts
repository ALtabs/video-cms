import { Routes } from '@angular/router';
import { HomepageComponent } from './homepage/homepage.component';
import { SignupComponent } from './signup/signup.component';
import { LoginComponent } from './login/login.component';
import { UploadVideoComponent } from './upload-video/upload-video.component';
import { VideoUpdateComponent } from './video-update/video-update.component';
import { AuthGuard } from './auth/auth.guard';

export const routes: Routes = [
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: 'home', component: HomepageComponent, canActivate: [AuthGuard]  },
  { path: 'signup', component: SignupComponent },
  { path: 'login', component: LoginComponent },
  { path: 'upload', component: UploadVideoComponent, canActivate: [AuthGuard] },
  { path: 'update/:id', component: VideoUpdateComponent, canActivate: [AuthGuard] },
  { path: '**', redirectTo: '/login' }
];
