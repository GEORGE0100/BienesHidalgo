import 'package:bieneshidalgo/firebase/auth_services.dart';
import 'package:bieneshidalgo/styles/app_colors.dart';
import 'package:bieneshidalgo/styles/home_page.dart';
import 'package:flutter/material.dart';

class OlvidePage extends StatelessWidget {
  OlvidePage({super.key});

  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.center,
                  colors: <Color>[AppColors.background, AppColors.primary])),
        ),
        title: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.background2,
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const HomePage()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 0),
            child: Column(
              children: [
                Flex(
                  direction: (MediaQuery.of(context).size.width > 1100)
                      ? Axis.horizontal
                      : Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'BIENES ',
                      style: TextStyle(
                          color: AppColors.background,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'HIDALGO',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Text(
                  'RECUPERACIÓN DE CONTRASEÑA',
                  style: TextStyle(
                      color: AppColors.font,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text('INGRESA TU CORREO ELECTRÓNICO'),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Usuario',
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      AuthServices()
                          .OlvideContra(_emailController.text, context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.background,
                        foregroundColor: AppColors.font2),
                    child: const Text(
                      'Enviar Correo',
                      style: TextStyle(color: AppColors.font2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecuperarPage extends StatelessWidget {
  const RecuperarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.center,
                  colors: <Color>[AppColors.background, AppColors.primary])),
        ),
        title: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.background2,
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const HomePage()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 0),
            child: Column(
              children: [
                Flex(
                  direction: (MediaQuery.of(context).size.width > 1100)
                      ? Axis.horizontal
                      : Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'BIENES ',
                      style: TextStyle(
                          color: AppColors.background,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'HIDALGO',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Text(
                  'RECUPERACIÓN DE CONTRASEÑA',
                  style: TextStyle(
                      color: AppColors.font,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text('SE HA ENVIADO UN LINK A TU CORREO ELECTRÓNICO'),
                const SizedBox(
                  height: 8,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
