// ignore_for_file: must_be_immutable, unnecessary_overrides, no_logic_in_create_state

import 'package:bieneshidalgo/styles/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowPage extends StatefulWidget {
  String tipo;
  ShowPage({super.key, required this.tipo});

  @override
  State<ShowPage> createState() {
    return _ShowPageState();
  }
}

class _ShowPageState extends State<ShowPage> with TickerProviderStateMixin {
  late int cIndex;
  late String tipo;
  @override
  void initState() {
    tipo = widget.tipo;
    cIndex = 0;
    super.initState();
  }

  @override
  void didUpdateWidget(ShowPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.tipo != oldWidget.tipo) {
      tipo = widget.tipo;
      cIndex = 0;
      print(tipo);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String tipo2 = 'VENTA';
    if (cIndex == 0) {
      tipo2 = 'VENTA';
    } else if (cIndex == 1) {
      tipo2 = 'RENTA';
    } else if (cIndex == 2) {
      tipo2 = 'FAVORITOS';
    }
    final Stream<QuerySnapshot> userStream = FirebaseFirestore.instance
        .collection('Casas')
        .where('Tipo', isEqualTo: widget.tipo)
        .where('Tipo2', isEqualTo: tipo2)
        .snapshots();
    final double height = MediaQuery.sizeOf(context).height;
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      children: [
        BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.price_change,
                ),
                label: 'VENTA'),
            BottomNavigationBarItem(
                icon: Icon(Icons.view_headline), label: 'RENTA'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: 'FAVORITOS')
          ],
          currentIndex: cIndex,
          onTap: (index) {
            setState(() {
              cIndex = index;
            });
          },
          elevation: 0,
          backgroundColor: Colors.grey.shade200,
          selectedItemColor: AppColors.primary,
        ),
        Divider(
          color: AppColors.primary,
          height: 1,
          thickness: 3,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: height / 1.3),
              child: StreamBuilder<QuerySnapshot>(
                  stream: userStream,
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      List<DocumentSnapshot> doc = snapshot.data!.docs;
                      if (doc.isNotEmpty) {
                        return Grid(s: doc);
                      } else {
                        return const Center(
                            child: Text('NO EXISTE INFORMACIÓN'));
                      }
                    } else {
                      return const Center(child: Text('CARGANDO...'));
                    }
                  }))),
        ),
        Container(
          height: 100,
          color: Colors.grey.shade200,
        )
      ],
    );
  }
}

class Grid extends StatefulWidget {
  final List<DocumentSnapshot> s;
  const Grid({super.key, required this.s});

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                (MediaQuery.of(context).orientation == Orientation.landscape)
                    ? 2
                    : 1),
        itemCount: widget.s.length,
        itemBuilder: (context, index) {
          DocumentSnapshot doc = widget.s[index];
          return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                elevation: 5,
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Material(
                              elevation: 5,
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(15),
                              child: SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        doc['Images'][1],
                                        height: 200,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            doc['Nombre'],
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ))),
                ),
              ));
        });
  }
}
