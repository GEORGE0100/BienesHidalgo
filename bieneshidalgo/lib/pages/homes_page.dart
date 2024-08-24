import 'package:bieneshidalgo/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomesPage extends StatefulWidget {
  const HomesPage({super.key});

  @override
  State<HomesPage> createState() => _HomesPageState();
}

class _HomesPageState extends State<HomesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            SizedBox(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Text(
                      "BUSCAR PROPIEDADES",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Buscar',
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.6),
                          hoverColor: Colors.white.withOpacity(0.5)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: AppColors.font2),
                      label: const Text('BUSCAR',
                          style: TextStyle(color: AppColors.font2)),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: height / 2),
              child: CarouselSlider.builder(
                  itemCount: 10,
                  itemBuilder:
                      (BuildContext context, int index, int pageViewIndex) =>
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey.shade300),
                                child: Center(
                                    child: Text(
                                  "ANUNCIO ${index + 1}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ))),
                          ),
                  options: CarouselOptions()),
            )
          ],
        ));
  }
}
