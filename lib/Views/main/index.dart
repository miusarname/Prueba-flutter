import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prueba_flutter/Views/main/detail_screen.dart';

class Index extends StatelessWidget {
  Future<List<Map<String, String>>> _fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> jsonData = List<Map<String, dynamic>>.from(json.decode(response.body));
      List<Map<String, String>> data = jsonData.map((item) {
        return {
          'title': item['title'] as String,
          'body': item['body'] as String,
        };
      }).toList();
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hola, Andres', style: TextStyle(fontFamily: 'MonaB', fontSize: 30)),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 249, 251, 252),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Buscar',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Articulos',
                style: TextStyle(fontSize: 21),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 261,
                child: FutureBuilder<List<Map<String, String>>>(
                  future: _fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      List<Map<String, String>> titlesAndBodies = snapshot.data ?? [];
                      List<String> titles = titlesAndBodies.map((data) => data['title']!).toList();
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: titles.length >= 2 ? 2 : titles.length, // Mostrar solo los dos primeros títulos
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  image:
                                      'https://lh3.googleusercontent.com/u/0/drive-viewer/AITFw-zj2vYF9gv23loZ7ikmcgaMRNVQLo8WWwpvSJvIIeic_6DewhMu4b-Cv2ETgPYJSrFMGLqINZGbFNVQCRAhVS_FZTdeTA=w1920-h939',
                                  title: titles[index],
                                  body: titlesAndBodies[index]['body']!,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: CustomCard(
                              width: 150,
                              borderRadius: 10,
                              child: Column(
                                children: [
                                  Image.network(
                                    'https://lh3.googleusercontent.com/u/0/drive-viewer/AITFw-zj2vYF9gv23loZ7ikmcgaMRNVQLo8WWwpvSJvIIeic_6DewhMu4b-Cv2ETgPYJSrFMGLqINZGbFNVQCRAhVS_FZTdeTA=w1920-h939',
                                    width: 150,
                                    height: 150,
                                  ),
                                  const SizedBox(height: 8),
                                  Expanded(
                                    child: Text(
                                      titles[index],
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Otros articulos',
                style: TextStyle(fontSize: 21),
              ),
              const SizedBox(height: 16),
              FutureBuilder<List<Map<String, String>>>(
                future: _fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    List<Map<String, String>> titlesAndBodies = snapshot.data ?? [];
                    // Mostrar el resto de los títulos a partir del tercer elemento
                    List<Map<String, String>> restOfTitlesAndBodies = titlesAndBodies.length > 2
                        ? titlesAndBodies.sublist(2)
                        : [];
                    List<String> restOfTitles = restOfTitlesAndBodies.map((data) => data['title']!).toList();
                    return SizedBox(
                      height: 90 * restOfTitles.length + 5 * (restOfTitles.length - 1),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: restOfTitles.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  image:
                                      'https://lh3.googleusercontent.com/u/0/drive-viewer/AITFw-zj2vYF9gv23loZ7ikmcgaMRNVQLo8WWwpvSJvIIeic_6DewhMu4b-Cv2ETgPYJSrFMGLqINZGbFNVQCRAhVS_FZTdeTA=w1920-h939',
                                  title: restOfTitles[index],
                                  body: restOfTitlesAndBodies[index]['body']!,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Stack( // Usamos Stack para sobrepone el card y los botones
                              children: [
                                CustomCard(
                                  height: 90,
                                  borderRadius: 10,
                                  child: Row(
                                    children: [
                                      Image.network(
                                        'https://lh3.googleusercontent.com/u/0/drive-viewer/AITFw-zj2vYF9gv23loZ7ikmcgaMRNVQLo8WWwpvSJvIIeic_6DewhMu4b-Cv2ETgPYJSrFMGLqINZGbFNVQCRAhVS_FZTdeTA=w1920-h939',
                                        width: 72,
                                        height: 74,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          restOfTitles[index],
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned( // Posicionamos los botones en la parte superior izquierda
                                  top: 27,
                                  left: 8,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Ink(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black.withOpacity(0.5), // Color de fondo del botón
                                        ),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.arrow_back,
                                            color: Colors.white, // Color del icono
                                          ),
                                        ),
                                      ),
                                      Ink(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black.withOpacity(0.5), // Color de fondo del botón
                                        ),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.more_vert,
                                            color: Colors.white, // Color del icono
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  final Widget child;

  const CustomCard({
    Key? key,
    this.width,
    this.height,
    required this.borderRadius,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }
}
