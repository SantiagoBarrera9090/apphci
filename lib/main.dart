import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Universidad de la Sabana'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStyledContainer("Energías, materiales y ambiente", Colors.blue, "https://www.unisabana.edu.co/energiamaterialesyambiente/"),
                  _buildStyledContainer("Grupo de Investigación en Bioprospección (GIBP)", Colors.green, "https://www.unisabana.edu.co/grupodeinvestigacionenbioprospeccion/"),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStyledContainer("Grupo de Investigación en Sistemas Logísticos", Colors.orange, "https://www.unisabana.edu.co/investigacion/portafoliodegruposdeinvestigacion/"),
                  _buildStyledContainer("HCD Human Centered Design", Colors.pink, "https://www.unisabana.edu.co/humancentereddesignhcd/"),
                ],
              ),
              SizedBox(height: 16.0),
              _buildLargeContainer("Cuestionario", Colors.blue, ""),
              SizedBox(height: 16.0),
              _buildLargeContainer("Habla con un profesional", Colors.lightBlueAccent, ""),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStyledContainer(String text, Color color, String url) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          width: 160.0,
          height: 160.0,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLargeContainer(String text, Color color, String url) {
    return GestureDetector(
      onTap: () async {

      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
