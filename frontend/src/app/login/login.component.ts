import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule, HttpClientModule],
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  loginForm: FormGroup;
  loginError: string | null = null;


  constructor(private fb: FormBuilder, private router: Router, private http: HttpClient) {
    this.loginForm = this.fb.group({
      username: ['', [Validators.required]],
      password: ['', [Validators.required]]
    });
  }

  onSubmit() {
    if (this.loginForm.valid) {
      const loginData = this.loginForm.value;
      const credentials = { username: loginData.username, password: loginData.password };
      this.http.post('https://cms-backend-sp1z.onrender.com/api/login/', credentials)
            .subscribe(
                (response: any) => {
                  console.log('Login successful', response);
                    localStorage.setItem('access_token', response.access);
                    localStorage.setItem('refresh_token', response.refresh);
                    localStorage.setItem('user_id', response.user_id);
                    this.router.navigate(['/home']);
                },
                (error) => {
                  this.loginError = 'Login failed. Please try again.';
                }
            );

    }
  }

    // Navigate to the signup page
    navigateToSignup() {
      this.router.navigate(['signup']);
    }
}
