import 'package:flutter/material.dart';
import 'package:tailorapp/auth/auth_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Gallery'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent, // Foody theme color
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Welcome Text
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            // Image to create foody ambiance
            Image.asset(
              'assets/images/food.png', // Add an image of food or restaurant
              height: 150,
            ),
            const SizedBox(height: 30),
            // Email Field
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email, color: Colors.orangeAccent),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            // Password Field
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock, color: Colors.orangeAccent),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Login Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () async {
                try {
                  await _authService.loginUser(
                    _emailController.text,
                    _passwordController.text,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logged in Successfully')),
                  );
                  // Navigate to home screen or next screen
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login Failed')),
                  );
                }
              },
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            // Forgot Password Text Button
            TextButton(
              onPressed: () {
                // Add your forgot password logic here
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.orangeAccent),
              ),
            ),
            const SizedBox(height: 20),
            // Option to navigate to the Signup screen
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
