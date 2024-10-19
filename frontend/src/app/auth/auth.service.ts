// auth.service.ts
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private router: Router) {}
  isTokenExpired(): boolean {
    const token = localStorage.getItem('access_token');
    if (!token) return true;

    const payload = this.parseJwt(token);
    if (!payload) return true;

    const expiration = payload.exp * 1000;
    return expiration < Date.now();
  }

  // Parse JWT token
  private parseJwt(token: string): any {
    try {
      const base64Url = token.split('.')[1];
      const base64 = decodeURIComponent(atob(base64Url).split('').map((c) => {
        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
      }).join(''));
      return JSON.parse(base64);
    } catch (e) {
      return null;
    }
  }
}
