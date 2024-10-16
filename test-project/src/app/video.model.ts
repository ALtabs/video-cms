export interface Video {
  id: number;
  title: string;
  description: string;
  file: string;
  created_at: string;
  user: number; // Assuming the user is represented by an ID
}
