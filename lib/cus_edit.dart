

import 'package:flutter/material.dart';

class CusEdits {


  static Widget normal(
      {
      @required String name,// header展示的文本
      @required List<String> data,//传入展示的数据
      @required int count,// 一行展示的数量
      @required double height,// 每一个小单元的高度
      double caspacing,// 横向方向间隔
      double maspacing,// 竖直方向的间隔
      double caradio,// 组件的长宽比
      TextStyle textStyle,// 展示的文本样式
      TextStyle emptyStyle,// 数据为空时展示的字符串的样式
      int undelete = 0,// 允许几个不让操作
      Widget udeleteIcon, // 如果undelete != 0时，展示的阻止操作的图标
      Widget ricon, // 展示的删除组件
      Widget emptyWidget, //  数据为空时展示的组件
      String emptyString, // 数据为空时展示的字符串，与emptyWidget互斥
      Function callBack // 删除回调
      }) {
    double cheight = data.length % count == 0
        ? ((data.length / count) + 1) * height
        : ((data.length / count).ceil() + 1) * height;
    return Container(
      padding: EdgeInsets.only(left:15, right:15),
      // key: UniqueKey(),
      height: cheight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: textStyle ?? TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
          ),
          Expanded(
            flex: 1,
            child: data.length == 0 ? Container(child: Center(child: emptyWidget ?? Text(emptyString ?? '暂无数据', style: emptyStyle ?? TextStyle(fontSize: 18, fontWeight: FontWeight.w300),),),) : GridView.count(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              crossAxisCount: count,
              crossAxisSpacing: caspacing ?? 30.0,
              mainAxisSpacing: maspacing ?? 20.0,
              childAspectRatio: caradio ?? 2.5,
              physics: const NeverScrollableScrollPhysics(),
              children: data.map((e) {
                int idx = data.indexOf(e);
                return GestureDetector(
                  onTapUp: (t) {
                    if(undelete != 0 && idx < undelete)return;
                    callBack(e);
                  },
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        child: Center(
                          child: Text(e),
                        ),
                      ),
                      Positioned(
                        width: 8,
                        height: 8,
                        right: 10,
                        top: -10,
                        child: undelete != 0 && idx + 1 <= undelete ? udeleteIcon??Icon(Icons.delete, color: Colors.grey,) : ricon,
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }



}