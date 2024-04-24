import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mygallery/core/constant/allApp_constants.dart';
import 'package:mygallery/core/constant/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mygallery/controller/home_controller.dart';
import 'package:mygallery/core/constant/allApp_constants.dart';
import 'package:mygallery/core/constant/colors.dart';
import 'package:mygallery/core/constant/connection_status.dart';
import 'package:mygallery/view/widgets/home/home_btn.dart';

class HomePage extends GetView<HomeController> {
  final box = GetStorage();
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20.0),
        color: AppColors.primary.withOpacity(0.2),
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    'Welcome \n ${box.read(USER_MODEL)['name']}',
                    style: TextStyle(
                        fontSize: 25.0,
                        color: AppColors.black.withOpacity(0.6)),
                  ),
                ),
                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: AppColors.white,
                  backgroundImage:
                      const AssetImage('assets/images/man.jpg'),
                )
              ],
               ),


            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeButton(
                  btnColor: AppColors.white,
                  iconColor: Colors.red,
                  text: 'log out',
                  function: controller.logOut,
                  icon: Icons.arrow_back_outlined,
                  btnPaddingH: 15.0,
                  btnPaddingV: 3.0,
                  isBold: false,
                  titleSize: 22.0,
                ),
                HomeButton(
                  btnColor: AppColors.white,
                  iconColor: AppColors.sadad,
                  text: 'upload',
                  function: controller.uploadImage,
                  icon: Icons.arrow_upward,
                  btnPaddingH: 15.0,
                  btnPaddingV: 3.0,
                  isBold: false,
                  titleSize: 22.0,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            GetBuilder<HomeController>(
              builder: (controller) => controller.connectionStatus ==
                      ConnectionStatus.LOADING
                  ? const CircularProgressIndicator(
                      color: AppColors.primary,
                    )
                  : controller.connectionStatus ==
                          ConnectionStatus.SERVERFAILURE
                      ?  Center(
                          child: Text('Server Failure' ,style: TextStyle(fontSize: 30.0,color: AppColors.grey)),
                        )
                      : controller.connectionStatus ==
                              ConnectionStatus.OFFLINEFAILURE
                          ?  Center(
                              child: Text('Offline Failure',style: TextStyle(fontSize: 30.0,color: AppColors.grey),),
                            )
                          : controller.images.isEmpty
                              ?  Center(
                                  child: Text('No data yet !',style: TextStyle(fontSize: 30.0,color: AppColors.grey)),
                                )
                              : Expanded(
                                  child: GridView.builder(
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                                      itemCount: controller.images.length,
                                      itemBuilder: (context, index) => Card(
                                            shadowColor: AppColors.primary,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            clipBehavior: Clip.antiAlias,
                                            child: CachedNetworkImage(
                                              height: 100.0,
                                              width: 100.0,
                                              fit: BoxFit.cover,
                                              imageUrl:controller.images[index],
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              placeholder: (context, url) =>
                                                  const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: AppColors.primary,
                                                  strokeWidth: 0.1,
                                                ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),

            )))
              ],
        ),
      )),
    );
  }
}
