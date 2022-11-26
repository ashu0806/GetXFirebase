import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controllers/auth_controller.dart';
import 'package:getx_practice/controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({
    super.key,
    required this.email,
  });
  final controller = Get.put(HomeController());
  String email;

  @override
  Widget build(BuildContext context) {
    // Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // title: const Text(
          //   "API with GetX",
          // ),
          title: const Text(
            "Firebase Auth With GetX",
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Center(
              child: Text(
                "Welcome",
              ),
            ),
            Center(
              child: Text(
                email,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                AuthController.instance.logOut();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 65,
                ),
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
                    "Sign Out",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // Obx(
            //   () {
            //     if (controller.isLoading.value) {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     } else {
            //       return ListView.builder(
            //         physics: const ScrollPhysics(),
            //         shrinkWrap: true,
            //         itemCount: controller.productList.length,
            //         itemBuilder: (context, index) {
            //           return Padding(
            //             padding: const EdgeInsets.symmetric(
            //               horizontal: 15,
            //               vertical: 10,
            //             ),
            //             child: Container(
            //               height: 100,
            //               width: 100,
            //               alignment: Alignment.center,
            //               decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 borderRadius: BorderRadius.circular(
            //                   12,
            //                 ),
            //                 boxShadow: const [
            //                   BoxShadow(
            //                     offset: Offset(2, 2),
            //                     color: Color.fromARGB(255, 235, 235, 235),
            //                     spreadRadius: 3,
            //                     blurRadius: 5,
            //                   ),
            //                 ],
            //               ),
            //               child: ListTile(
            //                 leading: Image.network(
            //                   controller.productList[index].image,
            //                 ),
            //                 title: Text(
            //                   controller.productList[index].title,
            //                   overflow: TextOverflow.ellipsis,
            //                   style: const TextStyle(
            //                     fontSize: 14,
            //                     color: Colors.black,
            //                   ),
            //                 ),
            //                 subtitle: Text(
            //                   controller.productList[index].description,
            //                   overflow: TextOverflow.ellipsis,
            //                   style: const TextStyle(
            //                     fontSize: 12,
            //                     color: Colors.grey,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           );
            //         },
            //       );
            //     }
            //   },
            // ),
            // Center(
            //   child: Obx(
            //     () => Text(
            //       "Value ${controller.value}",
            //       style: const TextStyle(
            //         fontSize: 25,
            //         color: Colors.black,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 40,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     FloatingActionButton(
            //       onPressed: () {
            //         controller.incease();
            //       },
            //       child: const Icon(
            //         Icons.add,
            //       ),
            //     ),
            //     FloatingActionButton(
            //       onPressed: () {
            //         controller.decrease();
            //       },
            //       child: const Icon(
            //         Icons.remove,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
