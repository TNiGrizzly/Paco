import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ur_notes/theme/colors.dart';

class CardDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final List img;

  const CardDetailPage({Key key, this.title, this.description, this.img})
      : super(key: key);
  @override
  _CardDetailPageState createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _titleController.text = widget.title;
      _descriptionController.text = widget.description;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardColor,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
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
          onPressed: null,
          icon: Icon(
            Icons.save,
            color: white.withOpacity(0.7),
            size: 22,
          ),
        )
      ],
    );
  }

  Widget getBody() {
    return ListView(
      padding: EdgeInsets.only(top: 25, right: 15, bottom: 25, left: 15),
      children: [
        TextField(
          controller: _titleController,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 22,
              color: white.withOpacity(0.8)),
          decoration: InputDecoration(border: InputBorder.none),
        ),
        TextField(
          maxLines: 10,
          controller: _descriptionController,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 1.5,
              color: white.withOpacity(0.8)),
          decoration: InputDecoration(border: InputBorder.none),
        ),

      ],
    );
  }

}
