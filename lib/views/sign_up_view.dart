import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controllers/auth_controller.dart';
import 'package:getx_practice/views/sign_in_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign Up",
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/signup_page_image.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: emailController,
                  cursorColor: Colors.blue,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Enter email",
                    hintStyle: Theme.of(context).textTheme.headline5!.copyWith(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.black,
                      size: 25,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  cursorColor: Colors.blue,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Enter password",
                    hintStyle: Theme.of(context).textTheme.headline5!.copyWith(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                    prefixIcon: const Icon(
                      Icons.password_rounded,
                      color: Colors.black,
                      size: 25,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    AuthController.instance.register(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                RichText(
                  text: TextSpan(
                    text: "Have an account already? ",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                    children: [
                      TextSpan(
                        text: 'Sign In ',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => {
                                Get.to(
                                  () => const SignInView(),
                                ),
                              },
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
