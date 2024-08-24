import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final String user;
  const PostItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/descarga.jpeg',
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 10),
              Text(user)
            ],
          ),
          Image.asset('assets/images/descarga.jpeg'),
          const SizedBox(
            height: 20,
          ),
          Text('I am not throwing away my shot - A.Ham')
        ],
      ),
    );
  }
}
