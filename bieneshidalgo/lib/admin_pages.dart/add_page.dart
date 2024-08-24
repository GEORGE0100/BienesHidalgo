// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously, avoid_print
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'dart:math';
import 'package:bieneshidalgo/components/Text_Fields.dart';
import 'package:bieneshidalgo/firebase/fire_store.dart';
import 'package:bieneshidalgo/styles/app_colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:windows_toast/windows_toast.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String? tipo = 'CASA';
  setTipo(String? val) {
    setState(() {
      tipo = val;
    });
  }

  final TextEditingController nameCasa = TextEditingController();
  final TextEditingController ciudad = TextEditingController();
  final TextEditingController estado = TextEditingController();
  final TextEditingController tipox = TextEditingController();
  final TextEditingController tipox2 = TextEditingController();
  final TextEditingController superficie = TextEditingController();
  final TextEditingController construccion = TextEditingController();
  final TextEditingController precio = TextEditingController();
  final TextEditingController recamaras = TextEditingController();
  final TextEditingController fecha = TextEditingController();
  final TextEditingController descripcion = TextEditingController();
  String? tipo2 = 'VENTA';
  setTipo2(String? val) {
    setState(() {
      tipo2 = val;
    });
  }

  final urls = <String>{'0'};
  Future addIm(PickedFile? pickedFile, File? photo, String deco,
      BuildContext context, String name) async {
    if (kIsWeb) {
      Reference ref = FirebaseStorage.instance.ref('/$deco').child(name);
      try {
        ref.putData(await pickedFile!.readAsBytes());
        WindowsToast.show('Se han guardado correctamente', context, 30);
      } catch (e) {
        print(e);
        WindowsToast.show('ERROR!', context, 30);
      }
    } else {
      FirebaseStorage storage = FirebaseStorage.instance;
      if (photo == null) return;
      final fileName = basename(photo.path);
      try {
        final ref = storage.ref('/$deco').child(fileName);
        await ref.putFile(photo);
        WindowsToast.show('Se han guardado correctamente', context, 30);
      } catch (e) {
        print(e);
        WindowsToast.show('ERROR!', context, 30);
      }
    }
    setState(() {});
  }

  var nams = <String>{'0'};
  int rng = Random().nextInt(100000);
  final List<File> imageFileList = [];
  void selectImg(String deco, BuildContext context) async {
    imageFileList.clear();
    final ImagePicker imagePicker = ImagePicker();
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      for (XFile image in selectedImages) {
        final pick = PickedFile(image.path);
        addIm(pick, File(image.path), deco, context, image.name);
        nams.add(image.name);
        print(nams);
        await Future.delayed(const Duration(milliseconds: 30));
      }
    }
    setState(() {});
  }

  void saveIm(String deco) async {}

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat(' d-MM-yyyy | kk:mm').format(now);
    double? width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
          padding: const EdgeInsets.only(
              left: 100, right: 100, bottom: 100, top: 30),
          child: Material(
            elevation: 5,
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Material(
                  elevation: 5,
                  color: AppColors.primary,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: SizedBox(
                    height: 50,
                    width: width,
                    child: const Center(
                        child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "AGREGAR PROPIEDADES",
                        style: TextStyle(
                            color: AppColors.font,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                  ),
                ),
                Divider(
                  color: AppColors.primaryD,
                  thickness: 6,
                  height: 6,
                ),
                SizedBox(
                  width: width,
                  child: Flex(
                    direction: (MediaQuery.of(context).size.width > 1100)
                        ? Axis.horizontal
                        : Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Material(
                                  elevation: 0,
                                  color: Colors.green.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        MyTexts(
                                            label: 'TITULO DE LA PROPIEDAD'),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        MyTextField(
                                            label: "TITULO DE LA PROPIEDAD",
                                            type: TextInputType.none,
                                            expands: false,
                                            controller: nameCasa),
                                        const SizedBox(height: 30),
                                        MyTexts(label: 'CIUDAD'),
                                        MyTextField(
                                            label: "CIUDAD",
                                            type: TextInputType.none,
                                            expands: false,
                                            controller: ciudad),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        MyTexts(label: 'ESTADO'),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        MyTextField(
                                            label: "ESTADO",
                                            type: TextInputType.none,
                                            expands: false,
                                            controller: estado),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        MyTexts(label: 'TIPO'),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              child: RadioListTile(
                                                  title: MyTexts(label: "CASA"),
                                                  value: 'CASA',
                                                  activeColor:
                                                      AppColors.background,
                                                  groupValue: tipo,
                                                  onChanged: (value) {
                                                    setTipo(value);
                                                  }),
                                            ),
                                            SizedBox(
                                              width: 170,
                                              child: RadioListTile(
                                                  title:
                                                      MyTexts(label: "TERRENO"),
                                                  value: 'TERRENO',
                                                  activeColor:
                                                      AppColors.background,
                                                  groupValue: tipo,
                                                  onChanged: (value) {
                                                    setTipo(value);
                                                  }),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        MyTexts(label: 'VENTA/RENTA'),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              child: RadioListTile(
                                                  title:
                                                      MyTexts(label: "VENTA"),
                                                  value: 'VENTA',
                                                  activeColor:
                                                      AppColors.background,
                                                  groupValue: tipo2,
                                                  onChanged: (value) {
                                                    setTipo2(value);
                                                  }),
                                            ),
                                            SizedBox(
                                              width: 170,
                                              child: RadioListTile(
                                                  title:
                                                      MyTexts(label: "RENTA"),
                                                  value: 'RENTA',
                                                  activeColor:
                                                      AppColors.background,
                                                  groupValue: tipo2,
                                                  onChanged: (value) {
                                                    setTipo2(value);
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ))),
                      Expanded(
                          flex: 1,
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Material(
                                  elevation: 0,
                                  color: Colors.green.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        MyTexts(label: 'SUPERFICIE'),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        MyTextField(
                                            label: "SUPERFICIE",
                                            type: TextInputType.none,
                                            expands: false,
                                            controller: superficie),
                                        const SizedBox(height: 30),
                                        MyTexts(label: 'CONSTRUCCIÓN'),
                                        MyTextField(
                                            label: "CONSTRUCCIÓN",
                                            type: TextInputType.none,
                                            expands: false,
                                            controller: construccion),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        MyTexts(label: 'PRECIO'),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        MyTextField(
                                            label: "PRECIO",
                                            type: TextInputType.none,
                                            expands: false,
                                            controller: precio),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        MyTexts(label: 'NO. RECÁMARAS'),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        MyTextField(
                                            label: "NO. RECÁMARAS",
                                            type: TextInputType.none,
                                            expands: false,
                                            controller: recamaras),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          children: [
                                            MyTexts(label: 'FECHA:'),
                                            MyTexts(label: formattedDate),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ))),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      children: [
                        MyTexts(label: "DESCRIPCIÓN"),
                        const SizedBox(height: 3),
                        SizedBox(
                            height: 250,
                            child: MyTextField(
                                label: "",
                                type: TextInputType.multiline,
                                expands: true,
                                controller: descripcion)),
                      ],
                    )),
                SizedBox(
                    height: 40,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        String f = nameCasa.text
                            .replaceAll(" ", "")
                            .substring(0, nameCasa.text.length - 3);

                        String c = ciudad.text
                            .replaceAll(" ", "")
                            .substring(0, ciudad.text.length - 2);
                        String id = f + rng.toString() + c;
                        selectImg(id, context);
                      },
                      icon: const Icon(
                        Icons.image,
                        color: Colors.white,
                      ),
                      label: const Text('SELECCIONAR IMÁGENES',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.background,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    )),
                SizedBox(
                  height: 100,
                  child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: ListView.builder(
                          itemCount: imageFileList.length,
                          itemBuilder: (context, index) {
                            return Text('$urls');
                          })),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: const EdgeInsets.all(25),
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                                height: 70,
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                    String f = nameCasa.text
                                        .replaceAll(" ", "")
                                        .substring(0, nameCasa.text.length - 3);

                                    String c = ciudad.text
                                        .replaceAll(" ", "")
                                        .substring(0, ciudad.text.length - 2);
                                    String id = f + rng.toString() + c;
                                    print(nams.length);
                                    if (nams.isNotEmpty) {
                                      FirebaseStorage storage =
                                          FirebaseStorage.instance;
                                      try {
                                        for (int i = 1; i < nams.length; i++) {
                                          await Future.delayed(
                                              const Duration(milliseconds: 30));
                                          storage
                                              .ref(id)
                                              .child(nams.elementAt(i))
                                              .getDownloadURL()
                                              .then((value) async {
                                            urls.add(value);
                                            await Future.delayed(const Duration(
                                                milliseconds: 30));
                                            addHouse(
                                                id,
                                                nameCasa.text,
                                                ciudad.text,
                                                estado.text,
                                                tipo,
                                                tipo2,
                                                double.parse(superficie.text),
                                                double.parse(construccion.text),
                                                double.parse(precio.text),
                                                int.parse(recamaras.text),
                                                now,
                                                descripcion.text,
                                                urls);
                                            print(urls);
                                          });
                                        }
                                      } catch (e) {
                                        WindowsToast.show('error', context, 30);
                                      }
                                    }
                                    await Future.delayed(
                                        const Duration(milliseconds: 30));
                                  },
                                  icon: const Icon(
                                    Icons.save,
                                    color: Colors.white,
                                  ),
                                  label: const Text('GUARDAR',
                                      style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.background,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                )),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                                height: 70,
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    print(urls);
                                  },
                                  icon: const Icon(
                                    Icons.cancel,
                                    color: Colors.white,
                                  ),
                                  label: const Text('CANCELAR',
                                      style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.background,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                )),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 100, width: 100, child: Text(""))
              ],
            ),
          )),
    );
  }
}
