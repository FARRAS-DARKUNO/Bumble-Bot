import 'package:bumble_bot/data/api/base_url.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:flutter/material.dart';

import '../../../data/model/detail_post_model.dart';
import '../../global/colors.dart';

class Comments extends StatelessWidget {
  final List<Komentar> data;
  const Comments({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widhtContain = sWidthFull(context) - 40;
    return data.isEmpty
        ? Container()
        : Column(
            children: data.map(
            (value) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: widhtContain,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          NetworkImage("$imageUrl${value.profile_picture}"),
                    ),
                    SizedBox(
                      width: widhtContain - 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(value.username, style: h3(cBlack)),
                          const SizedBox(height: 5),
                          Text(
                            value.comment,
                            style: h5(cBlack),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList());
  }
}
