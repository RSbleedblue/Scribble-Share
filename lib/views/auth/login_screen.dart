import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scribble_share/constants/color_constants.dart';
import 'package:scribble_share/providers/login_provider.dart';
import 'package:scribble_share/widgets/common_elevatedbutton.dart';
import 'package:scribble_share/widgets/common_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  const SizedBox(height: 40), 
                  Container(
                    height: 200,
                    width: 200,
                    child: Image.asset("lib/assets/images/logo.png"),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Welcome to Scribble Share",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: navyBlueColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      "Signup or login below to explore the scribble with friends",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CommonTextField(
                      label: "Email",
                      controller: _emailController,
                      prefixIcon: Icons.email,
                    ),
                    const SizedBox(height: 10),
                    CommonTextField(
                      label: "Password",
                      controller: _passwordController,
                      prefixIcon: Icons.lock,
                      isPassword: true,
                    ),
                    const SizedBox(height: 20),
                    CommonElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          String? result = await context.read<LoginProvider>().loginUser(
                                context,
                                _emailController.text,
                                _passwordController.text,
                              );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(result ?? "Unknown error")),
                          );
                        }
                      },
                      child: const Text('Login', style: TextStyle(color: primaryColor, fontSize: 16, fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
