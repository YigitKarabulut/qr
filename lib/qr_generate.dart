import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class QrGenerate extends StatefulWidget {
  const QrGenerate({Key? key}) : super(key: key);

  @override
  _QrGenerateState createState() => _QrGenerateState();
}

class _QrGenerateState extends State<QrGenerate> {
  final _txtController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QrImage(
            data: _txtController.text,
            size: 300,
            backgroundColor: Colors.white,
          ),
         const  SizedBox(height: 40,),
          buildGenerate(context),
    
        ],
      ),
    );
  }

  Widget buildGenerate(BuildContext context) {
    return TextField(
      controller: _txtController,
      style: const TextStyle(
        color: Color(0xff0d0f21),
        fontWeight: FontWeight.w400,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        hintText: 'Enter the data',

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        suffixIcon: IconButton(
          color: Theme.of(context).primaryColor,
          icon: const Icon(Icons.done,size: 30,),
          onPressed: ()=> setState(() { }),
        )
      ),

    );
  }
}
