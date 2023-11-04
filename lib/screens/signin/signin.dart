import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:kadu_ngo/providers/login_controller_provider.dart';
import 'package:kadu_ngo/screens/custombtn/custombtn.dart';
import 'package:kadu_ngo/screens/signup/signup.dart';
import 'package:kadu_ngo/theme/color.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _SignInScreenState extends ConsumerState<SignInScreen> {
  bool isObsecure = true;
  bool? checked = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColorDefault,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    color: AppColors.textColorPrimary,
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: height * .05),
                Container(
                  width: width * .9,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(69, 158, 158, 158),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextField(
                      style: TextStyle(color: AppColors.color, fontSize: 18),
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Email or username",
                        hintStyle: TextStyle(
                            color: AppColors.textColorSecondary, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * .02),
                Container(
                  width: width * .9,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(69, 158, 158, 158),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextField(
                      obscureText: isObsecure,
                      style:
                          const TextStyle(color: AppColors.color, fontSize: 18),
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Password",
                        hintStyle: const TextStyle(
                            color: AppColors.textColorSecondary, fontSize: 18),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObsecure = !isObsecure;
                            });
                          },
                          icon: Icon(
                            isObsecure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.color,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * .01),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: checked,
                            onChanged: (value) {
                              setState(() {
                                checked = value;
                              });
                            },
                          ),
                          const Text(
                            "Remember me",
                            style: TextStyle(
                                color: AppColors.textColorPrimary,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgotten password?",
                          style: TextStyle(
                              color: AppColors.textColorPrimary, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * .01),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        ref.read(loginControllerProvider.notifier).login(
                            emailController.text, passwordController.text);
                      },
                    )),
                SizedBox(height: height * .02),
                GestureDetector(
                  onTap: () => Get.to(() => const SignUpScreen()),
                  child: CustomBtn(
                    width: width * .9,
                    text: "Create Account",
                    btnColor: AppColors.color,
                    btnTextColor: Colors.black,
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

// class CustomBtn extends StatelessWidget {
//   const CustomBtn({
//     super.key,
//     required this.width,
//     required this.text,
//     this.btnColor,
//     this.btnTextColor,
//   });

//   final double width;
//   final String text;
//   final Color? btnColor;
//   final Color? btnTextColor;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       decoration: BoxDecoration(
//         color: btnColor,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       alignment: Alignment.center,
//       child: ElevatedButton(
//         // padding: const EdgeInsets.symmetric(vertical: 15),
//         onPressed: () {
//           ref
//               .read(loginControllerProvider.notifier)
//               .login(emailController.text, passwordController.text);
//         },
//         child: Text(
//           text,
//           style: TextStyle(
//             color: btnTextColor,
//             fontWeight: FontWeight.w700,
//             fontSize: 18,
//           ),
//         ),
//       ),
//     );
//   }
// }
