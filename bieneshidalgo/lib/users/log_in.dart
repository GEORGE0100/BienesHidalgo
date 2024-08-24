// ignore_for_file: unused_import

import 'package:bieneshidalgo/blocs/bloc/users_bloc.dart';
import 'package:bieneshidalgo/firebase/auth_services.dart';
import 'package:bieneshidalgo/styles/app_colors.dart';
import 'package:bieneshidalgo/styles/home_page.dart';
import 'package:bieneshidalgo/users/admin_pages/admin_pages.dart';
import 'package:bieneshidalgo/users/log_up.dart';
import 'package:bieneshidalgo/users/olvide_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late AnimationController controller;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..addListener(() {
            setState(() {});
          });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
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
            padding:
                const EdgeInsets.only(left: 30, right: 30, bottom: 0, top: 40),
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
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'HIDALGO',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Text(
                  'BIENVENIDOS DE VUELTA',
                  style: TextStyle(
                      color: AppColors.font,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text('INGRESA PARA CONTINUAR'),
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
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    hintText: 'Contraseña',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.6),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => OlvidePage()));
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: AppColors.background),
                    child: const Text('Olvidé Contraseña'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    width: 300,
                    height: 50,
                    child: BlocConsumer<UsersBloc, UsersState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<UsersBloc>(context).add(SignInUser(
                                _emailController.text.trim(),
                                _passwordController.text.trim()));
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.font2),
                          child: const Text(
                            'INICIAR SESIÓN',
                            style: TextStyle(color: AppColors.font2),
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
                        } else if (state is UsersLoadingState) {}
                      },
                    )),
                const SizedBox(
                  height: 8,
                ),
                /*const Text(
                  'Or sign In with',
                  style: TextStyle(color: AppColors.font),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.background2,
                      foregroundColor: AppColors.font),
                  child: const Text('Log In With Google'),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.background2,
                        foregroundColor: AppColors.font),
                    child: const Text('Log In With Facebook')),*/
                Row(
                  children: [
                    const Text("No tienes cuenta? "),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const SignUpPage()));
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: AppColors.background),
                        child: const Text("Registrate"))
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
