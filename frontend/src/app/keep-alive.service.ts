import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { interval } from 'rxjs';

@Injectable({
  providedIn: 'root', // This makes the service available application-wide
})
export class KeepAliveService {
  private keepAliveUrl = 'https://cms-backend-sp1z.onrender.com/keep-alive';

  constructor(private http: HttpClient) {
    this.startKeepAlive();
  }

  private startKeepAlive() {
    // Send a request every 5 minutes (300000 ms)
    interval(300000).subscribe(() => {
      this.http.get(this.keepAliveUrl).subscribe({
        next: (response) => console.log('Keep-alive response:', response),
        error: (error) => console.error('Keep-alive error:', error),
      });
    });
  }
}
