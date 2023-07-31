import 'package:flutter/material.dart';
import 'package:hero_button/hero_button.dart';
import 'package:prueba_flutter/Views/register/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://lh3.googleusercontent.com/u/0/drive-viewer/AITFw-zj2vYF9gv23loZ7ikmcgaMRNVQLo8WWwpvSJvIIeic_6DewhMu4b-Cv2ETgPYJSrFMGLqINZGbFNVQCRAhVS_FZTdeTA=w1920-h939'),
            fit: BoxFit.cover, // Ajustar la imagen al tamaño del container
          ),
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.end, // Alineación en la parte inferior
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                style:
                    TextStyle(color: Colors.grey), // Establecer color de texto
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.brown, // Establecer fondo blanco
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0), // Establecer el radio del borde
                    ),
                    borderSide:
                        BorderSide.none, // Sin borde en el borde exterior
                  ),
                  labelText: 'Correo Electronico',
                  labelStyle: TextStyle(
                    color: Colors.white, // Establecer color de etiqueta
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                obscureText: true,
                style:
                    TextStyle(color: Colors.grey), // Establecer color de texto
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.brown, // Establecer fondo blanco
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0), // Establecer el radio del borde
                    ),
                    borderSide:
                        BorderSide.none, // Sin borde en el borde exterior
                  ),
                  labelText: 'Constraseña',
                  labelStyle: TextStyle(
                    color: Colors.white, // Establecer color de etiqueta
                  ),
                ),
              ),
            ),
            HeroButton(
              height: 40,
              borderRound: false,
              textColor: Colors.white,
              textSize: 20,
              backColor: const Color(0xFFFC6020),
              padding: const EdgeInsets.all(20),
              fullWidth: true,
              label: "Ingresar",
              onPressed: () {
                print("Button Clicked!");
              },
            ),
            HeroButton(
              height: 40,
              borderRound: false,
              textColor:
                  const Color(0xFFC19679), // Establecer color hexadecimal aquí
              textSize: 20,
              backColor: Colors.transparent, // Relleno transparente
              padding: const EdgeInsets.all(20),
              fullWidth: true,
              label: "Crear Cuenta",
              onPressed: () {
                _navigateToSecondScreen(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

// Función para navegar a la segunda pantalla
void _navigateToSecondScreen(BuildContext context) {
  Navigator.push(
    context,
    PageRouteBuilder(
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Posición inicial (derecha)
        const end = Offset.zero; // Posición final (centro)
        const curve = Curves.easeInOut; // Curva de animación

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return SecondScreen(); // Retornamos la segunda pantalla
      },
    ),
  );
}
