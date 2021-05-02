import 'package:flutter/material.dart';

import 'package:ur_notes/theme/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AddNote extends StatelessWidget {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardColor,
      appBar: getAppBar(context),
      body: getBody(context),
    );
  }

  Widget getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: cardColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          size: 22,
          color: white.withOpacity(0.7),
        ),
      ),
      actions: [
        IconButton(
          onPressed: (){
              ref.add({   //Añadiendo la nota a Firebase
                'title': _titleController.text,
                'content': _descriptionController.text
              }).whenComplete(() => Navigator.pop(context));
          },
          icon: Icon(
            Icons.save,
            color: white.withOpacity(0.7),
            size: 22,
          ),
        )
      ],
    );
  }

  Widget getBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 25, right: 15, bottom: 25, left: 15),
      children: [
        TextField(
          controller: _titleController,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 22,
              color: white.withOpacity(0.8)),
          autofocus: true,
          decoration: InputDecoration(border: InputBorder.none, hintText: 'Título', hintStyle: TextStyle(color: white.withOpacity(0.5)),)
        ),
        TextField(
          maxLines: 10,
          controller: _descriptionController,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.5,
              color: white.withOpacity(0.8)),
          decoration: InputDecoration(border: InputBorder.none, hintText: 'Contenido', hintStyle: TextStyle(color: white.withOpacity(0.5)),)
        ),

      ],
    );
  }

}
