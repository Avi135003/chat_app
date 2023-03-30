import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("First Name"),
            TextField(
              controller: controller.fnameController,
              decoration: InputDecoration(
                  hintText: "Enter Your First Name"
              ),
            ),
            SizedBox(height: 15,),
            Text("Last Name"),
            TextField(
              controller: controller.lnameController,
              decoration: InputDecoration(
                  hintText: "Enter Your Last Name"
              ),
            ),
            SizedBox(height: 15,),
            Text("Email"),
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                  hintText: "Enter Your Email"
              ),
            ),
            SizedBox(height: 15,),
            Text("Create Password"),
            TextField(
              controller: controller.passController,
              obscureText: controller.passObsecure.value,
              decoration: InputDecoration(
                  hintText: "Create your password",
                  suffixIcon: IconButton(onPressed: () {
                    controller.passObsecure.value= !controller.passObsecure.value;
                  },
                    icon: controller.passObsecure.value?
                    Icon(Icons.visibility_off_outlined):
                    Icon(Icons.visibility_outlined),)
              ),
            ),
            SizedBox(height: 15,),
            Text("Confirm Password"),
            TextField(
              obscureText: controller.confPassObsecure.value,
              decoration: InputDecoration(
                  hintText: "Confirm password",
                  suffixIcon: IconButton(onPressed: () {
                    controller.confPassObsecure.value= !controller.confPassObsecure.value;
                  },
                    icon: controller.confPassObsecure.value?
                    Icon(Icons.visibility_off_outlined):
                    Icon(Icons.visibility_outlined),)
              ),
            ),
            SizedBox(height: 25,),
            InkWell(
              onTap: (){


                print(controller.fnameController.text.trim());
                print(controller.emailController.text.trim());
                print(controller.passController.text.trim());

                controller.registerUser(
                  name: controller.fnameController.text.trim(),
                  email: controller.emailController.text.trim().toString(),
                  password: controller.passController.text.trim().toString(),
                );
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue
                ),
                child: Center(child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 20),),),
              ),
            ),

            SizedBox(height: 15,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Text("SignIn",style: TextStyle(color: Colors.blueAccent),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
