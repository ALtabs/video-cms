import { Component, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { AuthService } from './auth/auth.service';
import { Router } from '@angular/router';
import { KeepAliveService } from './keep-alive.service';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
})
export class AppComponent {
  title = 'frontend';
  constructor(
    private keepAliveService: KeepAliveService,
    private authService: AuthService,
    private router: Router
  ) {
    if (this.authService.isTokenExpired()) {
      this.router.navigate(['/login']);
      localStorage.removeItem('access_token');
      localStorage.removeItem('refresh_token');
      localStorage.removeItem('user_id');
    }
  }
}
