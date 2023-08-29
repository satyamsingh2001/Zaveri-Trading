import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gogrow/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:gogrow/Custom_BlocObserver/notifire_clor.dart';
import 'package:gogrow/utils/medeiaqury/medeiaqury.dart';

// ignore: must_be_immutable
class Pages extends StatefulWidget {
  String? title;
  Pages(this.title);
  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  late ColorNotifier notifier;
  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifier.setIsDark = false;
    } else {
      notifier.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.getwihitecolor,
      appBar: CustomAppBar(
          notifier.getwihitecolor, widget.title!, notifier.getblck,
          height: height / 15),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
          textAlign: TextAlign.start,
          style: TextStyle(),
        ),
      ),
    );
  }
}
