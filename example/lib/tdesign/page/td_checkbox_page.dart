import 'package:flutter/material.dart';
import 'package:tdesign_flutter/td_export.dart';

///
/// TDCheckbox演示
///
class TDCheckboxPage extends StatefulWidget {
  const TDCheckboxPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TDCheckboxPageState();
  }
}

class TDCheckboxPageState extends State<TDCheckboxPage> {
  bool isChecked = false;

  List<String>? checkIds;

  TDCheckboxGroupController? controller;

  @override
  void initState() {
    super.initState();
    controller = TDCheckboxGroupController();
  }

  Widget _divider() {
    return const Divider();
  }

  Widget _title(String title) {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(left: 10),
      alignment: Alignment.centerLeft,
      child: Text(title),
    );
  }

  Widget _desc(String title) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(fontSize: 12, color: TDTheme.of(context).grayColor6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget current = ListView(
      children: [
        _title('基础多选框'),
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TDCheckbox(
                title: '多选',
              ),
              _divider(),
              const TDCheckbox(
                title: '多选',
              ),
              _divider(),
              const TDCheckbox(
                title: '禁用状态',
                enable: false,
                checked: true,
              ),
              _divider(),
              const TDCheckbox(
                title: '多选多选多选多选多选多选多选多选多选多选多选多选',
                enable: false,
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          color: Colors.white,
        ),

        _title('右侧多选框'),
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TDCheckbox(
                contentDirection: TDContentDirection.left,
                title: '多选',
              ),
              _divider(),
              const TDCheckbox(
                contentDirection: TDContentDirection.left,
                title: '多选',
                checked: true,
              ),
              _divider(),
              const TDCheckbox(
                contentDirection: TDContentDirection.left,
                title: '多选',
                checked: true,
              ),
              _divider(),
              const TDCheckbox(
                contentDirection: TDContentDirection.left,
                title: '多选',
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          color: Colors.white,
        ),

        _title('自定义图标多框类型'),
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TDCheckbox(
                style: TDCheckboxStyle.square,
                title: '多选',
              ),
              _divider(),
              const TDCheckbox(
                style: TDCheckboxStyle.square,
                title: '多选',
                checked: true,
              ),
              _divider(),
              const TDCheckbox(
                style: TDCheckboxStyle.square,
                title: '多选',
                checked: true,
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          color: Colors.white,
        ),


        _title('分组控制'),
        _desc(
            '通过TDCheckboxGroup可以把多个TDCheckbox组成一个分组，TDCheckbox的布局和样式自由，只需要拥有同一个FdCheckboxGroup祖宗节点即可，可以通过TDCheckboxGroupController实现对分组的统一控制。'),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Text('控制器:'),
              const SizedBox(
                width: 10,
              ),
              MaterialButton(
                  child: const Text('勾选1和3'),
                  onPressed: () {
                    controller?.toggle('1', true);
                    controller?.toggle('3', true);
                  }),
              MaterialButton(
                  child: const Text('全选'),
                  onPressed: () {
                    controller?.toggleAll(true);
                  }),
              MaterialButton(
                  child: const Text('全部取消'),
                  onPressed: () {
                    controller?.toggleAll(false);
                  }),
              MaterialButton(
                  child: const Text('反选'),
                  onPressed: () {
                    controller?.reverseAll();
                  }),
            ],
          ),
        ),

        TDCheckboxGroup(
            controller: controller,
            onChangeGroup: (checkedId) {
              checkIds = checkedId;
              setState(() {});
              // FuiToast.show(context, "checked:$checkIds");
            },
            checkedIds: checkIds,
            onOverloadChecked: () {
              TDToast.showText('最大只能勾选3个选项', context: context);
            },
            child: Container(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 7,
                  mainAxisExtent: 35,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) => TDCheckbox(
                  id: '$index',
                  title: '选项$index',
                ),
              ),
              padding: const EdgeInsets.all(16),
              color: Colors.white,
            )),

        _title('完全自定义样式'),

        TDCheckboxGroup(
            controller: controller,
            onChangeGroup: (checkedId) {
              checkIds = checkedId;
              setState(() {});
              // FuiToast.show(context, "checked:$checkIds");
            },
            customIconBuilder: (context, check)=>null,
            customContentBuilder: (context, check, title) {
              final theme = TDTheme.of(context);
              return Container(
                child: Text(title!, style: TextStyle(color: check ? Colors.white : Colors.black),),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  border: Border.all(color: check ? theme.brandColor7 : theme.grayColor5),
                  color: check ? theme.brandColor7 : Colors.transparent
                ),
              );
            },
            checkedIds: checkIds,
            onOverloadChecked: () {
              TDToast.showText('最大只能勾选3个选项', context: context);
            },
            child: Container(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 7,
                  mainAxisExtent: 35,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) => TDCheckbox(
                  id: '2$index',
                  title: '选项$index',
                ),
              ),
              padding: const EdgeInsets.all(16),
              color: Colors.white,
            )),

      ],
    );

    current = Container(
      child: current,
      color: TDTheme.of(context).grayColor1,
    );

    current = Scaffold(
      appBar: AppBar(
        title: const Text('多选框 Checkbox'),
      ),
      body: current,
    );
    return current;
  }
}
