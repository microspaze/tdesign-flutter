import 'package:flutter/material.dart';
import 'package:tdesign_flutter/td_export.dart';

// ignore: use_key_in_widget_constructors
class TDEmptyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TDEmptyPageState();
}

class _TDEmptyPageState extends State<TDEmptyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('空状态 Empty'),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              TDEmpty(
                type: TDEmptyType.operation,
                operationText: '操作按钮',
                emptyText: '描述文字',
                image: Icon(
                  TDIcons.info_circle_filled,
                  size: 84,
                ),
              ),
            ],
          ),
        ));
  }
}
