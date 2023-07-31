import 'dart:io';
import 'package:hero_button/hero_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void _navigateToGifView() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            GifView(), // Creamos una nueva vista llamada GifView
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Fondo transparente en el AppBar
        leading: Ink(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFFAE8D0).withOpacity(0.6),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFFFDB761),
            ),
          ),
        ),
      ),
      body: Container(
        color: Color(
            0xFFF9FBFC), // Establecemos el color de fondo de toda la página
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 15, 150, 1),
                child: Text(
                  "Crear cuenta",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily:
                        'Calibri', // Cambiamos el tipo de fuente a "Calibri"
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _pickImage(ImageSource.gallery);
                },
                child: Center(
                  child: Column(
                    children: [
                      _image != null
                          ? Image.file(
                              _image!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey,
                              child: const Center(
                                child: Text(
                                  "Subir Imagen",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                      ),
                      labelText: 'Campo 2',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                      ),
                      labelText: 'Campo 2',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                      ),
                      labelText: 'Campo 2',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                      ),
                      labelText: 'Campo 2',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 10), // Margen horizontal de 10px
                child: HeroButton(
                  height: 40,
                  borderRound: false,
                  textColor: Colors.white,
                  textSize: 20,
                  backColor: const Color(0xFFFC6020),
                  padding: const EdgeInsets.all(20),
                  fullWidth: true,
                  label: "Ingresar",
                  onPressed: () {
                    _navigateToGifView(); // Navegamos a la nueva vista con el GIF
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Creamos una nueva vista para mostrar el GIF
class GifView extends StatelessWidget {
  const GifView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
            'assets/picture.gif'), // Mostramos el GIF desde los activos
      ),
    );
  }
}
