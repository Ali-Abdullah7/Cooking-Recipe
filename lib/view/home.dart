import 'package:cooking_recipe/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final xcontroller = Get.lazyPut(() => HomeViewModel());
  HomeViewModel controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Cooking Recipe'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  filled: true,
                  fillColor: Colors.green.withOpacity(0.4),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
                // physics: const ScrollPhysics(),
                // shrinkWrap: true,
                // primary: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: controller.list.length,
                itemBuilder: (context, i) {
                  // final lengthData = controller.list[i];
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  controller.list[i].image.toString()),
                              fit: BoxFit.fill)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                padding: const EdgeInsets.all(3),
                                height: 40,
                                color: Colors.black.withOpacity(0.5),
                                child: Center(
                                    child: GetBuilder<HomeViewModel>(
                                        builder: (controller) => Text(controller
                                            .list[i].label
                                            .toString())))),
                            Container(
                                padding: const EdgeInsets.all(3),
                                height: 40,
                                color: Colors.black.withOpacity(0.5),
                                child: Center(
                                    child: GetBuilder<HomeViewModel>(
                                        builder: (controller) => Text(
                                            "Source : " +
                                                controller.list[i].source
                                                    .toString()))))
                          ]),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
