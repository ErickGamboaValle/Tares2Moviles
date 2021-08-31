import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool gender = false;
  var estaturaController = TextEditingController();
  var pesoController = TextEditingController();
  double getIMC() {
    var estatura = double.parse(estaturaController.text);
    var peso = double.parse(pesoController.text);
    var imc = peso / (estatura * estatura);
    return imc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('IMC'),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 14,
            ),
            Text(
              "Ingresa tus datos para calcular tu IMC",
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.male),
                  color: gender ? Colors.blue : Colors.grey,
                  onPressed: () {
                    gender = !gender;
                    setState(() {});
                  },
                ),
                IconButton(
                  icon: Icon(Icons.female),
                  color: gender ? Colors.grey : Colors.pink,
                  onPressed: () {
                    gender = !gender;
                    setState(() {});
                  },
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.square_foot),
              title: Padding(
                padding: EdgeInsets.only(right: 24),
                child: TextField(
                  controller: estaturaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Ingresar estatura en metros",
                      border: OutlineInputBorder()),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.monitor_weight),
              title: Padding(
                padding: EdgeInsets.only(right: 24),
                child: TextField(
                  controller: pesoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Ingresar peso en KG",
                      border: OutlineInputBorder()),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      var imc = getIMC();
                      if (gender) {
                        _showMyDialogMale(imc);
                      } else {
                        _showMyDialogFemale(imc);
                      }
                      ;
                    },
                    child: Text(
                      "Calcular",
                    ),
                  ),
                ),
                //Text("Valor ${imc.toStringAsFixed(2)} "),
              ],
            )
          ],
        ));
  }

  Future<void> _showMyDialogMale(imc) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Su IMC es: ${imc.toStringAsFixed(2)} '),
          content: SingleChildScrollView(
            child: Column(children: [
              Text("Tabla para Hombres"),
              Text(""),
              Text("Edad    IMC ideal"),
              Text("16-24     20-25"),
              Text("25-34     21-26"),
              Text("35-44     22-27"),
              Text("45-54     23-28"),
              Text("55-64     22-26"),
              Text("65-90     21-25"),
            ]),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMyDialogFemale(imc) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Su IMC es: ${imc.toStringAsFixed(2)} '),
          content: SingleChildScrollView(
            child: Column(children: [
              Text("Tabla para Mujeres"),
              Text(""),
              Text("Edad    IMC ideal"),
              Text("16-24     19-24"),
              Text("25-34     20-25"),
              Text("35-44     21-26"),
              Text("45-54     22-27"),
              Text("55-64     23-28"),
              Text("65-90     25-30"),
            ]),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
