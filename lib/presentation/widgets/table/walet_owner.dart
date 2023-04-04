import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/utils/list_reputation.dart';
import 'package:flutter/material.dart';

class WaletOwner extends StatelessWidget {
  const WaletOwner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sWidthFull(context),
      child: DataTable(
        headingRowHeight: 20,
        columns: const [
          DataColumn(label: Text('')),
          DataColumn(label: Text('')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(
              Text('Project', style: h4(cPremier)),
            ),
            DataCell(
              Text('BumbleCoint', style: h5(cBlack)),
            ),
          ]),
          DataRow(cells: [
            DataCell(
              Text('Wallet Address', style: h4(cPremier)),
            ),
            DataCell(
              Text('xabiobneiudnbaeiuhfiuaehb', style: h5(cBlack)),
            ),
          ]),
          DataRow(cells: [
            DataCell(
              Text('Reputation', style: h4(cPremier)),
            ),
            DataCell(
              Row(
                children: [
                  Text('Good ', style: h5(cBlack)),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: cGood,
                    ),
                    height: 12,
                    width: 12,
                  )
                ],
              ),
            ),
          ]),
          DataRow(cells: [
            DataCell(
              Text('KYC', style: h4(cPremier)),
            ),
            DataCell(
              Text('KYC Verivied', style: h5(cBlack)),
            ),
          ]),
        ],
      ),
    );
  }
}
