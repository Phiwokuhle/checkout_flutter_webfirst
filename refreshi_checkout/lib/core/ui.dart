import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
String zar(int cents)=>NumberFormat.currency(locale:'en_ZA',symbol:'R ',decimalDigits:2).format(cents/100);
String dateLabel(DateTime date)=>DateFormat('EEE, d MMM yyyy • HH:mm').format(date);
class PageFrame extends StatelessWidget {
 const PageFrame({super.key,required this.child});
 final Widget child;
 @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Row(mainAxisSize:MainAxisSize.min,children:[Icon(Icons.spa_outlined),SizedBox(width:10),Text('refreshi',style:TextStyle(fontWeight:FontWeight.w800))])),body:Center(child:ConstrainedBox(constraints:const BoxConstraints(maxWidth:1180),child:Padding(padding:const EdgeInsets.fromLTRB(20,20,20,40),child:child))));
}
