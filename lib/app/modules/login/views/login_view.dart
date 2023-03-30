import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/app_assets.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Email"),
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                  hintText: "Enter your email"
              ),
            ),
            SizedBox(height: 10,),
            Text("Password"),
            Obx(()=>TextField(
              controller: controller.passController,
              obscureText: controller.isObsecure.value,
              decoration: InputDecoration(
                  hintText: "Enter your password",
                  suffixIcon: IconButton(onPressed: () {
                    controller.isObsecure.value= !controller.isObsecure.value;
                  },
                    icon: controller.isObsecure.value?
                    Icon(Icons.visibility_off_outlined):
                    Icon(Icons.visibility_outlined),)
              ),
            ),),
            SizedBox(height: 15,),

            InkWell(
              onTap: (){
                controller.loginWithPassword(
                    email: controller.emailController.text.trim().toString(),
                    password: controller.passController.text.trim().toString()
                );
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue
                ),
                child: Center(child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 20),),),
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(onTap:(){
                  controller.signInWithGoogle();
                },child: SizedBox(
                    height: 60,width: 60,
                    child: Image.asset(AppAssets.gmailLogo))),
                InkWell(onTap:(){},child: SizedBox(
                    height: 60,width: 60,
                    child: Image.asset(AppAssets.fbLogo))),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("don't have an account?"),
                InkWell(
                    onTap: (){
                      Get.toNamed(Routes.REGISTER);
                    },
                    child: Text("Sign Up",style: TextStyle(color: Colors.blueAccent),)),
              ],
            ),
            SizedBox(height: 25,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: (){

                    },
                    child: Text("Forget Password?",style: TextStyle(color: Colors.blue),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
