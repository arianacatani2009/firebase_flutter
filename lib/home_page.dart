import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'guest_book.dart'; // Importa el widget GuestBook
import 'src/authentication.dart';
import 'src/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubicacion APP'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/UBICACION.png',
                width: 100, // Cambia este valor según el tamaño deseado
                height: 100, // Cambia este valor según el tamaño deseado
              ),
            ),
            const SizedBox(height: 8),
            Consumer<ApplicationState>(
              builder: (context, appState, _) => AuthFunc(
                loggedIn: appState.loggedIn,
                signOut: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ),
            const Divider(
              height: 8,
              thickness: 1,
              indent: 8,
              endIndent: 8,
              color: Colors.grey,
            ),
            const Center(child: Header("Prueba 2 (SEGUNDO BIMESTRE) ")),
            const Center(
              child: Paragraph(
                'Bienvenidos a la Aplicacion UBI!!',
              ),
            ),
            Consumer<ApplicationState>(
              builder: (context, appState, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (appState.loggedIn) ...[
                    // const Header('Discussion'),
                    /*GuestBook(
                      messages: appState.guestBookMessages,
                      addMessage: (message) =>
                          appState.addMessageToGuestBook(message),
                    ),*/
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
