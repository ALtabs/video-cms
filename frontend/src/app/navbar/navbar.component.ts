import { Component } from '@angular/core';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css'],
  standalone: true
})
export class NavbarComponent {
  // You can add logic for sign out here
  signOut() {
    console.log('Sign out clicked');
    // Implement your sign out logic here
  }
}
