import 'dart:io';

import 'package:bumble_bot/data/repository/contain_repository.dart';
import 'package:bumble_bot/presentation/widgets/alert/alert_dynamic.dart';
import 'package:bumble_bot/presentation/widgets/box_input/add_location_on_posting.dart';
import 'package:bumble_bot/presentation/widgets/box_input/input_image.dart';
import 'package:bumble_bot/presentation/widgets/box_input/text_normal_input.dart';
import 'package:bumble_bot/presentation/widgets/button/normal_button.dart';
import 'package:bumble_bot/provider/location_bloc/location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../global/size.dart';
import '../widgets/button/back_button.dart';

class Posting extends StatefulWidget {
  const Posting({
    Key? key,
  }) : super(key: key);

  @override
  State<Posting> createState() => _PostingState();
}

class _PostingState extends State<Posting> {
  File? image;
  final title = TextEditingController();

  final hastag = TextEditingController();

  final caption = TextEditingController();

  bool isLoading = false;

  getImage(File? data) {
    setState(() {
      image = data;
    });
  }

  onSubmit(
    BuildContext context,
    File? image,
    TextEditingController title,
    TextEditingController caption,
    TextEditingController hastag,
    String location,
  ) async {
    setState(() => isLoading = true);
    if (image == null || title.value.text == '') {
      alertDynamic(
          context, "Terjadi Keselahan", "Gambar dan Title Tidak Boleh Kosong");
    } else {
      try {
        ContainRepository()
            .postPost(
          title.value.text,
          caption.value.text,
          hastag.value.text,
          location,
          image,
        )
            .then((value) {
          Navigator.pop(context);
          alertDynamic(context, value.status, value.message);
        });
      } catch (_) {
        alertDynamic(context, "Terjadi Tesalahan", "Terjadi Tesalahan");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: BlocBuilder<LocationBloc, LocationState>(
            builder: (context, state) {
              return SafeArea(
                child: Column(
                  children: <Widget>[
                    const BackButtonCustome(),
                    SizedBox(
                      height:
                          sHeightScreen(context) - sHeightBackButton(context),
                      child: SingleChildScrollView(
                        reverse: isKeyboardVisible,
                        child: Column(
                          children: [
                            InputImage(
                                onChangeFile: (value) => getImage(value)),
                            const SizedBox(height: 10),
                            TextNormalInput(hintText: 'Title', text: title),
                            const SizedBox(height: 10),
                            TextNormalInput(hintText: 'Hashtag', text: hastag),
                            const SizedBox(height: 10),
                            TextNormalInput(hintText: 'Caption', text: caption),
                            const SizedBox(height: 10),
                            // const AddPeopleOnPosting(),
                            const SizedBox(height: 10),
                            const AddLocationOnPosting(),
                            const SizedBox(height: 30),
                            GestureDetector(
                              onTap: () => isLoading
                                  ? null
                                  : onSubmit(
                                      context,
                                      image,
                                      title,
                                      caption,
                                      hastag,
                                      state.locationState,
                                    ),
                              child: NormalButton(
                                title: isLoading ? "Loading..." : 'Post',
                              ),
                            ),
                            sPaddingBottom(context),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
