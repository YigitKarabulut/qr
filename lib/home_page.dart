import 'package:flutter/material.dart';
import 'package:qr_code/qr_generate.dart';
import 'package:qr_code/qr_scan.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Qr Code Scan and Generate"),
        elevation: 0,
      ),
      body: Column(

        children: <Widget>[
          TabBar(

            controller: _tabController,
            labelColor: Theme.of(context).primaryColor,
            indicatorColor: Theme.of(context).primaryColor, //Color(0xff2aa6cd)
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            labelStyle: const TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),

            tabs: const [
              Tab(child: Text("QR Scan"),icon: Icon(Icons.qr_code_scanner),),
              Tab(child: Text("QR Generate"),icon: Icon(Icons.qr_code),),

            ],),
          Expanded(child: TabBarView(
            controller: _tabController,
            children: const <Widget>[
              QrScan(),
              QrGenerate(),

            ],
          ))
        ],


      ),
    );
  }
}
