library lkedit;

/// A Calculator.
import 'package:flutter/material.dart';
import 'cus_edit.dart';
class CusPage extends StatefulWidget {
  final List<String> addArr; // 已添加数据
  final List<String> unAddArr;// 未添加数据
  String addText; // 已添加文本
  String unAddText;// 未添加文本
  int count;//一行展示的数量
  double height; // 每一个小单元的高度
  double caspacing;// 横向方向间隔
  double maspacing;// 竖直方向的间隔
  double caradio;// 组件的长宽比
  TextStyle textStyle;// 展示的文本样式
  TextStyle emptyStyle;// 数据为空时展示的字符串的样式
  int undelete = 0;// 允许几个不让操作
  Widget udeleteIcon; // 如果undelete != 0时，展示的阻止操作的图标
  Widget ricon; // 展示的删除组件
  Widget aicon; // 展示要添加的组件
  Widget emptyWidget; //  数据为空时展示的组件
  String emptyString; // 数据为空时展示的字符串，与emptyWidget互斥
  Function deleteFC;
  Function addFC;
  CusPage(
          {
            @required this.addArr,
            @required this.unAddArr,
            @required this.addText,
            @required this.unAddText,
            @required this.count,
            @required this.height,
            this.addFC, 
            this.deleteFC,
            this.caspacing,
            this.maspacing,
            this.caradio,
            this.textStyle,
            this.emptyStyle,
            this.undelete,
            this.udeleteIcon,
            this.ricon,
            this.emptyWidget,
            this.emptyString,
          });
  @override
  _CusPageState createState() => _CusPageState();
}

class _CusPageState extends State<CusPage> {

Widget build(BuildContext context){
  return SingleChildScrollView(
          child: Column(children: [
            SizedBox(height:10),
            CusEdits.normal(
                name: widget.addText,
                data: widget.addArr,
                count: widget.count,
                undelete:widget.undelete ?? 0,
                height: widget.height,
                udeleteIcon:widget.udeleteIcon ,
                ricon: widget.ricon ?? Icon(Icons.delete, color: Colors.red),
                callBack: (e) {
                  widget.addArr.remove(e);
                  widget.unAddArr.add(e);
                  widget.deleteFC(e);
                  setState(() {
                  });
                }
                ),
            SizedBox(height: 10),
            CusEdits.normal(
                name: widget.unAddText,
                data: widget.unAddArr,
                count: widget.count,
                height: widget.height,
                ricon: widget.aicon ?? Icon(Icons.add, color: Colors.blue),
                callBack: (e) {
                   widget.unAddArr.remove(e);
                   widget.addArr.add(e);
                   widget.addFC(e);
                  setState(() {
                  });
                }
                )
          ]),
        );
}



}