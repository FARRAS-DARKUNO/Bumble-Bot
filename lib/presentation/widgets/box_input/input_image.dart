import 'dart:io';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../global/colors.dart';
import '../../global/size.dart';

class InputImage extends StatefulWidget {
  const InputImage({Key? key}) : super(key: key);

  @override
  State<InputImage> createState() => _InputImageState();
}

class _InputImageState extends State<InputImage> {
  File? file;
  @override
  Widget build(BuildContext context) {
    Future getImageGalery() async {
      final ImagePicker picker = ImagePicker();
      final XFile? imagePicker =
          await picker.pickImage(source: ImageSource.gallery);
      file = imagePicker == null ? null : File(imagePicker.path);
      setState(() {});
    }

    Future getImageTake() async {
      final ImagePicker picker = ImagePicker();
      final XFile? imagePicker =
          await picker.pickImage(source: ImageSource.camera);
      file = imagePicker == null ? null : File(imagePicker.path);
      setState(() {});
    }

    // Future getVideoTake() async {
    //   final ImagePicker picker = ImagePicker();
    //   final XFile? imagePicker =
    //       await picker.pickVideo(source: ImageSource.camera);
    //   file = imagePicker == null ? null :  File(imagePicker.path);
    //   print(file);
    //   setState(() {});
    // }

    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 450,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => getImageTake(),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: cPremier,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        height: 50,
                        width: sWidthDynamic(context, 0.9),
                        child: Row(
                          children: [
                            const Icon(Icons.camera_alt, color: cWhite),
                            Text('  Take Photo', style: h3(cWhite))
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => getImageGalery(),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: cPremier,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        height: 50,
                        width: sWidthDynamic(context, 0.9),
                        child: Row(
                          children: [
                            const Icon(Icons.photo, color: cWhite),
                            Text('  Galery Photo', style: h3(cWhite))
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.all(10),
                    //   decoration: const BoxDecoration(
                    //     color: cPremier,
                    //     borderRadius: BorderRadius.all(Radius.circular(20)),
                    //   ),
                    //   padding: const EdgeInsets.symmetric(horizontal: 30),
                    //   height: 50,
                    //   width: sWidthDynamic(context, 0.9),
                    //   child: Row(
                    //     children: [
                    //       const Icon(Icons.video_camera_back, color: cWhite),
                    //       Text('  Galery Video', style: h3(cWhite))
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        width: sWidthDynamic(context, 1) - 40,
        height: 250,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(width: 2, color: cPremier),
        ),
        child: file != null
            ? Image.file(file!, fit: BoxFit.cover)
            : const Icon(
                Icons.image,
                size: 150,
                color: cGray,
              ),
      ),
    );
  }
}
