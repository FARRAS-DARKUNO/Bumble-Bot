import 'dart:io';

import 'package:bumble_bot/data/repository/profile_repository.dart';
import 'package:bumble_bot/presentation/widgets/box_input/text_normal_input.dart';
import 'package:bumble_bot/presentation/widgets/button/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../global/colors.dart';
import '../global/size.dart';
import '../widgets/button/back_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? file;
  final name = TextEditingController();
  String nameTag = 'Name';

  getProfile() async {
    ProfileRepository().getProfileRepo().then((value) {
      setState(() {
        value.data.name == ''
            ? nameTag = "Change Name ..."
            : nameTag = value.data.name;
      });
    });
  }

  onSubmit() async {
    await ProfileRepository().postEditProfile(
      name.value.text,
      '',
      file,
      '',
    );
  }

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    Future getImageGalery() async {
      final ImagePicker picker = ImagePicker();
      final XFile? imagePicker =
          await picker.pickImage(source: ImageSource.gallery);
      file = imagePicker == null ? null : File(imagePicker.path);
      setState(() {});
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              const BackButtonCustome(),
              SizedBox(
                height: sHeightScreen(context) - sHeightBackButton(context),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () => getImageGalery(),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: cBlack,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: cWhite, width: 2),
                        ),
                        child: file != null
                            ? Image.file(file!, fit: BoxFit.cover)
                            : Container(),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextNormalInput(hintText: nameTag, text: name),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () => onSubmit(),
                      child: const NormalButton(
                        title: 'Submit',
                      ),
                    )
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
