import 'package:flutter/material.dart';

void main() {
  runApp(TouristApp());
}

class TouristApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lugares turisticos',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: TouristScreen(),
    );
  }
}

class Place {
  final String name;
  final String description;

  Place(this.name, this.description);
}

class TouristScreen extends StatelessWidget {
  final List<Place> places = [
    Place('Museo del Nacimiento', 'El Museo reúne más de 800 piezas. Se exhiben nacimientos artesanales elaborados por manos mexicanas e internacionales. Una gran parte de la colección fue creada por la propia coleccionista utilizando materiales de reuso. Cuenta con diferentes actividades interactivas.'),
    Place('Cerveceria Primus', '¡Ven a visita una Cervecería Artesanal Mexicana! Orgullosos productores de las marcas TEMPUS y JABALI Te guiaremos en el proceso de elaboración para que conozcas cómo se hace esta deliciosa bebida. Podrás también degustar nuestros producto'),
    Place('Museo de la Muerte', 'Museo de diversos materiales oriantados a la muerte'),
    Place('Coyotada', 'En que cosa mas indigna e insolente han convertido este lugar, mítico, histórico para México y el Mundo. Construyeron'),
    Place('Cava 57', 'Ven y vive una experiencia vinícola auténtica en el corazón del viñedo. Contamos con variedad de vinos rosados, tintos y espumosos que podrás maridar con quesos artesanales de la región.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atracciones en San Juan del Río'),
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                places[index].name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlaceDetailScreen(places[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PlaceDetailScreen extends StatelessWidget {
  final Place place;

  PlaceDetailScreen(this.place);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              place.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              place.description,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
