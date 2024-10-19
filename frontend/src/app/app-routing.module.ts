import { Routes } from '@angular/router';
import { HomepageComponent } from './homepage/homepage.component';
// import { VideoUploadComponent } from './video-upload/video-upload.component';
import { SignupComponent } from './signup/signup.component';
import { LoginComponent } from './login/login.component';

export const routes: Routes = [
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: 'home', component: HomepageComponent },
  { path: 'signup', component: SignupComponent },
  { path: 'login', component: LoginComponent },
];
