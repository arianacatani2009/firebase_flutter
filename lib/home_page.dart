import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider, PhoneAuthProvider;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'src/authentication.dart';
import 'src/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tu Guía de Ubicación',
          style: TextStyle(
            color: Color.fromARGB(255, 227, 235, 236), // Color llamativo
            fontWeight: FontWeight.bold, // Texto en negrita
            fontSize: 22, // Tamaño de la fuente
          ),
        ),
        backgroundColor: Colors.deepPurple, // Color de fondo de la AppBar
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            const Center(child: Header("Bienvenido a UBICATE APP")),
            Center(
              child: Image.asset(
                'assets/UBICACION.png',
                width: 350, // Cambia este valor según el tamaño deseado
                height: 350, // Cambia este valor según el tamaño deseado
              ),
            ),
            const SizedBox(height: 4),
            Consumer<ApplicationState>(
              builder: (context, appState, _) => Center(
                child: AuthFunc(
                  loggedIn: appState.loggedIn,
                  signOut: () {
                    FirebaseAuth.instance.signOut();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
