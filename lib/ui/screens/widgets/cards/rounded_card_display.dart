import 'package:flutter/material.dart';
import 'package:pos_v1/ui/utils/styles/text_style.dart';

class RoundedDisplayCard extends StatelessWidget {
  final Color titleColor;
  final Color contentColor;
  final String titleText;
  final String contentText;

  const RoundedDisplayCard({
    Key key,
    this.titleColor,
    this.contentColor,
    this.titleText,
    this.contentText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: titleColor,
          borderRadius: BorderRadius.all(Radius.circular(70))),
      child: Row(
        children: [
          Expanded(
              child: Container(
            child: Center(
                child: Text(
              titleText,
              style: TextsStyle.secondaryTextStyle,
            )),
          )),
          Expanded(
            child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  color: contentColor,
                  borderRadius: BorderRadius.all(Radius.circular(70)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    contentText,
                    style: TextsStyle.primaryTextStyle,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
