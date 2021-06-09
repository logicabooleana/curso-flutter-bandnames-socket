import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:curso_flutter/models/band.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Band> bands = [
    Band(id: "1",name: "Metallica",botes: 5),
    Band(id: "2",name: "La Renga",botes: 4),
    Band(id: "3",name: "Queen",botes: 6),
    Band(id: "3",name: "Bon jovi",botes: 8),
  ];

  @override
  Widget build(BuildContext context) {
  //return Scaffold();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("BandNames",style: TextStyle(color: Colors.grey)),
        backgroundColor: Colors.white,  
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (_, index) => bandTile(bands[index])
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 1,
        onPressed: () => addNewBand(),
      ),
    );
  }

  ListTile bandTile(Band band) {
    return ListTile(
          leading: CircleAvatar(child: Text( band.name.substring(0,1) )),
          title: Text(band.name),
          trailing: Text("${band.botes}",style: TextStyle(fontSize: 18.0)),
          onTap: (){ print(band.name);},
        );
  }

  addNewBand() async {



    final textController= new TextEditingController();

    if( Platform.isIOS ){
      showCupertinoDialog(
        context: context, 
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("New band name:"),
            content: CupertinoTextField(
              controller: textController,
            ),
            actions: [
              CupertinoDialogAction(
                child: Text("add"),
                isDefaultAction: true,
                onPressed: () => addBandToList(name:textController.text ),
              ),
              CupertinoDialogAction(
                child: Text("Dismiss"),
                isDestructiveAction: true,
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        },
      );
    }else{
      showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text("New band name:"),
          content: TextField(
            controller: textController,
          ),
          actions: [
            MaterialButton(
              onPressed: () => addBandToList(name:textController.text ),
              child:Text("add"),
            )
          ],
        );
      },
      
      );
    }
    
  }
  void addBandToList({required String name}){
    if(name=="") return null;
    setState(() {
      bands.add(Band(id:DateTime.now().toString(),name: name));
      Navigator.pop(context);
    });
  }

}