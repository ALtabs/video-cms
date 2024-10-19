import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule, ValidationErrors } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { HttpClient } from '@angular/common/http';
@Component({
  selector: 'app-signup',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule, HttpClientModule],
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css']
})
export class SignupComponent {
  signupForm: FormGroup;
  hasErros: string | null = null;

  constructor(private fb: FormBuilder, private router: Router, private http: HttpClient) {
    this.signupForm = this.fb.group({
      username: ['', [Validators.required]],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required]],
      confirmPassword: ['', [Validators.required]]
    }, { validator: this.passwordMatchValidator });
  }

  passwordMatchValidator(form: FormGroup): ValidationErrors | null {
    return form.get('password')?.value === form.get('confirmPassword')?.value
      ? null : { mismatch: true };
  }

  onSubmit() {
    if (this.signupForm.valid) {
      const signupData = this.signupForm.value;
      const credentials = {
        username: signupData.username,
        email: signupData.email,
        password: signupData.password,
      };
      this.http.post('https://cms-backend-sp1z.onrender.com/api/register/', credentials)
            .subscribe(
                (response: any) => {
                  console.log('Signup successful', response);
                    this.router.navigate(['/login']);
                },
                (error) => {
                  this.hasErros = 'User Already Exists.';
                    console.error('Signup failed', error);
                }

      )
    }
  }

  navigateTologin() {
    this.router.navigate(['/']);
  }
}
