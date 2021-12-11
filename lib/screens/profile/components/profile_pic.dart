// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:secured_chat_app/screens/profile/profile_controller.dart';
import 'package:secured_chat_app/services/urls.dart';

class ProfilePicture extends StatelessWidget {
  ProfilePicture({
    Key key,
  }) : super(key: key);

  ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Obx(
            () => CircleAvatar(
              backgroundImage: (profileController.avatarUrl.value == null ||
                      profileController.avatarUrl.value == '')
                  ? const AssetImage('assets/images/person.jpg')
                  : NetworkImage(
                      urlAvatarImages + profileController.avatarUrl.value),
            ),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: GestureDetector(
                    onTap: () async {
                      ProfileController profileController = Get.find();
                      bool result = await profileController.getImage();
                      if (result) {
                        Get.snackbar("Başarılı", "Profil resmi değişti.");
                      } else {
                        Get.snackbar("Başarısız",
                            "Profil resmi değiştirilirken hata oluştu.");
                      }
                    },
                    child: SvgPicture.asset("assets/icons/camera_icon.svg")),
              ),
            ),
          )
        ],
      ),
    );
  }
}
