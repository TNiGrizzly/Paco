import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ur_notes/theme/colors.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.size,
    @required GlobalKey<ScaffoldState> drawerKey,
  }) : _drawerKey = drawerKey, super(key: key);

  final Size size;
  final GlobalKey<ScaffoldState> _drawerKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        width: size.width,
        height: 45,
        decoration: BoxDecoration(
            color: greyclaritou,
            boxShadow: [
              BoxShadow(
                  color: black.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 0)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                // Menu de busque arriba
                children: [
                  GestureDetector(
                    onTap: () {
                      // Ventana desplazante del lado izquierdo
                      _drawerKey.currentState.openDrawer();
                    },
                    child: Icon(
                      Icons.person,
                      color: white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
              Row(
                // Menu de desplazamiento, esquina superior derecha
                children: [
                  SizedBox(
                    //Apartado para el buscador de la barra superior
                    width: 10,
                  ),
                  Text(
                    //Texto de la barra superior
                    "Search your notes",
                    style: TextStyle(
                        fontSize: 15, color: white.withOpacity(0.7)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
