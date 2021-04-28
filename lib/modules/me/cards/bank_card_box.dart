import 'package:flutter/material.dart';
import 'package:flutter_bloc_boilerplate/shared/shared.dart';

class BankCardBox extends StatelessWidget {
  const BankCardBox({
    Key key,
    this.cardType,
    this.cardNum,
  }) : super(key: key);

  final String cardType;
  final String cardNum;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        cardType == 'VISA'
            ? Image.asset('assets/images/card_visa.png')
            : Image.asset('assets/images/card_master.png'),
        Positioned(
          width: SizeConfig().screenWidth,
          bottom: SizeConfig().screenWidth * 0.1,
          child: Text(
            '••••    ••••    ••••    $cardNum',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
