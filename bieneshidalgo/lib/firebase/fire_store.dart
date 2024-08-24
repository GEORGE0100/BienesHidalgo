import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addUser(String name, String email, String uid) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  final data = <String, String>{"Nombre": name, "Email": email};

  users.doc(uid).set(data);
}

Future<void> addHouse(
    String id,
    String nombre,
    String ciudad,
    String estado,
    String? tipo,
    String? tipo2,
    double superficie,
    double constr,
    double precio,
    int noRecamaras,
    Object fecha,
    String descripcion,
    var images) async {
  CollectionReference casas = FirebaseFirestore.instance.collection('Casas');
  final data2 = <String, Object?>{
    "Nombre": nombre,
    "Ciudad": ciudad,
    "Estado": estado,
    "Tipo": tipo,
    "Tipo2": tipo2,
    "Superficie": superficie,
    "Construccion": constr,
    "Fecha": fecha,
    "noRecamaras": noRecamaras,
    "descripcion": descripcion,
    "Images": images
  };
  casas.doc(id).set(data2);
}

String readUser() {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
  final uid = user?.uid;
  if (uid != null) {
    return uid as String;
  } else {
    return 'NoUser';
  }
}

class Users {
  final String? name;
  final String? email;

  Users({this.name, this.email});

  factory Users.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Users(email: data?['Email'], name: data?['Nombre']);
  }

  Map<String, dynamic> toFirestore() {
    return {"Nombre": name, "Email": email};
  }
}

Future<Users?> recop(String uid) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final ref = db.collection('Users').doc(uid).withConverter(
        fromFirestore: Users.fromFirestore,
        toFirestore: (Users users, _) => users.toFirestore(),
      );
  final docSnap = await ref.get();
  final userx = docSnap.data();

  return userx;
}
