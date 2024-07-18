// home_page.dart

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
      body: ListView(
        children: <Widget>[
          Image.asset('assets/UBICACION.png'),
          const SizedBox(height: 8),
          //const IconAndDetail(Icons.calendar_today, 'October 30'),
          //const IconAndDetail(Icons.location_city, 'San Francisco'),
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
          const Header("Prueba 2 (SEGUNDO BIMESTRE) "),
          const Paragraph(
            'Bienvenidos a la Aplicacion UBI!!',
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (appState.loggedIn) ...[
                  const Header('Discussion'),
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
    );
  }
}
