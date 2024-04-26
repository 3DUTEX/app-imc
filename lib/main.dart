import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _heightController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();
  String _result = "";
  SnackBar message = SnackBar(content: Text("teste"));

  void _clearFields() {
    _heightController.text = "";
    _weightController.text = "";

    setState(() {
      _result = "";
    });
  }

  void _calcIMC() {
    double height = double.parse(_heightController.text);
    double weight = double.parse(_weightController.text);
    double imc = weight / (height * height);

    setState(() {
      _result = "Seu IMC atual é: ${imc.toStringAsFixed(2)}";
    });
  }

  void _setHeightMask(String value) {
    double valueDouble = double.parse(value);
    if (valueDouble > 100) {
      setState(() {
        _heightController.text = (valueDouble / 100).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculadora de IMC",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: _clearFields,
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.person_outline, size: 200, color: Colors.green),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              style: TextStyle(decorationColor: Colors.green, fontSize: 25),
              decoration: InputDecoration(
                label: Text("Altura (kg)"),
                labelStyle: TextStyle(color: Colors.green),
              ),
              onChanged: _setHeightMask,
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              style: TextStyle(decorationColor: Colors.green, fontSize: 25),
              decoration: InputDecoration(
                label: Text("Peso (kg)"),
                labelStyle: TextStyle(color: Colors.green),
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: ElevatedButton(
                onPressed: _calcIMC,
                child: Text(
                  "Calcular",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, padding: EdgeInsets.all(15)),
              ),
            ),
            Text(
              (_result.isEmpty ? "Insira seus dados!" : _result),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, color: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}
