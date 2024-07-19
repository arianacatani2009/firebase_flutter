import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthFunc extends StatelessWidget {
  const AuthFunc({
    super.key,
    required this.loggedIn,
    required this.signOut,
  });

  final bool loggedIn;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: 400, // Ancho fijo para el botón
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                 // Fondo transparente
                  foregroundColor: Color.fromARGB(255, 34, 43, 158), // Color del texto
                  side: BorderSide(
                    color: Color.fromARGB(255, 232, 240, 243), // Color celeste del borde
                    width: 2, // Grosor del borde
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                onPressed: () {
                  !loggedIn ? context.push('/sign-in') : signOut();
                },
                child: Text(
                  !loggedIn ? 'Inicio Sesión' : 'Cerrar Sesión',
                ),
              ),
            ),
          ),
          const SizedBox(height: 16), // Espacio entre los botones
          Visibility(
            visible: loggedIn,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: 200, // Ancho fijo para el botón
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // Fondo transparente
                    foregroundColor: Colors.black, // Color del texto
                    side: BorderSide(
                      color: Color.fromARGB(255, 232, 240, 243), // Color celeste del borde
                      width: 2, // Grosor del borde
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  onPressed: () {
                    context.push('/profile');
                  },
                  child: const Text('Perfil'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
