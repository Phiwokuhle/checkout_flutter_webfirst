import 'package:flutter/material.dart';
ThemeData appTheme() {
 const teal=Color(0xff087f8c);
 final scheme=ColorScheme.fromSeed(seedColor:teal,brightness:Brightness.light,surface:const Color(0xfff8faf9));
 return ThemeData(useMaterial3:true,colorScheme:scheme,scaffoldBackgroundColor:scheme.surface,
   appBarTheme:const AppBarTheme(backgroundColor:Colors.transparent,centerTitle:false),
   inputDecorationTheme:InputDecorationTheme(border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),contentPadding:const EdgeInsets.symmetric(horizontal:16,vertical:14)),
   cardTheme:CardThemeData(color:Colors.white,elevation:0,shape:RoundedRectangleBorder(side:const BorderSide(color:Color(0xffdce6e5)),borderRadius:BorderRadius.circular(16))),
   filledButtonTheme:FilledButtonThemeData(style:FilledButton.styleFrom(padding:const EdgeInsets.symmetric(horizontal:22,vertical:18),shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(12)))),
 );
}
