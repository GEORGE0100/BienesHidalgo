// ignore_for_file: unused_import

import 'package:bieneshidalgo/blocs/bloc/users_bloc.dart';
import 'package:bieneshidalgo/firebase/auth_services.dart';
import 'package:bieneshidalgo/firebase/fire_store.dart';
import 'package:bieneshidalgo/pages/homes_page.dart';
import 'package:bieneshidalgo/styles/app_colors.dart';
import 'package:bieneshidalgo/styles/home_page.dart';
import 'package:bieneshidalgo/users/admin_pages/admin_pages.dart';
import 'package:bieneshidalgo/users/log_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  static String id = 'login_screen';
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String uid = readUser();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
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
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Flex(
                  direction: (MediaQuery.of(context).size.width > 1100)
                      ? Axis.horizontal
                      : Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'BIENES ',
                      style: TextStyle(
                          color: AppColors.background,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'HIDALGO',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Text(
                  'BIENVENIDOS',
                  style: TextStyle(
                      color: AppColors.font,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const Text('REGISTRATE'),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Correo Electrónico',
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.6),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    hintText: 'Contraseña',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.6),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _nameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    hintText: 'Nombre Completo',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.6),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    width: 300,
                    child: BlocConsumer<UsersBloc, UsersState>(
                      builder: (context, state) {
                        return SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<UsersBloc>(context).add(
                                  SignUpUser(_emailController.text.trim(),
                                      _passwordController.text.trim()));
                              addUser(_nameController.text,
                                  _emailController.text, uid);
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: AppColors.primary,
                                foregroundColor: AppColors.font2),
                            child: const Text(
                              'REGISTRARSE',
                              style: TextStyle(color: AppColors.font2),
                            ),
                          ),
                        );
                      },
                      listener: (BuildContext context, UsersState state) {
                        if (state is UsersSuccessState) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const AdminPage()),
                              (Route route) => false);
                        } else if (state is UsersFailureState) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: Center(child: Text('Error')),
                                );
                              });
                        } else if (state is UsersLoadingState) {
                          print('CARGANDO...');
                        }
                      },
                    )),
                Row(
                  children: [
                    const Text("Ya tienes una cuenta? "),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                              (Route route) => false);
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: AppColors.background),
                        child: const Text("Iniciar Sesión"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
