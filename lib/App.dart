import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}


class _AppState extends State<App> {

  TextEditingController _textEditingControllerAlcohol = TextEditingController();
  TextEditingController _textEditingControllerGasoline = TextEditingController();
  var _response = "";


  void _solve()
  {
     double? alcohol = double.tryParse(_textEditingControllerAlcohol.text);
     double? gasoline = double.tryParse(_textEditingControllerGasoline.text);

      if(_textEditingControllerAlcohol.text == "" ||
      _textEditingControllerGasoline.text == "" || gasoline == null
      || alcohol == null){
        setState(() {
          this._response = "A value is null or you are using ',' instead '.' on price!";
        });
      }else{
        if(alcohol/gasoline >= 0.7){
          setState(() {
            this._response = "Fill up w/ gasoline!";
          });
        }else{
          setState(() {
            this._response = "Fill up w/ alcohol!";
          });
        }
      }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // top bar
      appBar: AppBar(title: const Text("Alcohol or Gasoline?",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                      backgroundColor: Colors.blue[900],
      ),

      // body
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.all(24), child: Image.asset("assets/images/logo.png"),),
              Padding(padding: EdgeInsets.all(24), child:
              Text("Know the best option for suply:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),),
              Padding(padding: EdgeInsets.all(24), child:
              //----------- Text field --------------
              TextField(
                controller: this._textEditingControllerAlcohol,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Alcohol price, 1.99"),
                style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
              ),),
              Padding(padding: EdgeInsets.all(24), child:
              // ----------- Text field --------------
              TextField(
                controller: this._textEditingControllerGasoline,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Gasoline price, 2.99"),
                style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
              ),),
              Padding(padding: EdgeInsets.all(24), child:
              ElevatedButton(
                  onPressed: (){_solve();},
                  child: const Text("Solve", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                  style: ButtonStyle(padding: MaterialStateProperty.all(const EdgeInsets.only(left:30,top: 20,right: 30,bottom: 20),),
                    backgroundColor: MaterialStateProperty.all(
                        Colors.blue[900]),
                    foregroundColor: MaterialStateProperty.all(Colors.white),)),
              ),
              Padding(
                padding: EdgeInsets.all(24),
                child: Text("$_response", style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.deepOrange),),),
            ],
          ),
        ),
      ),
    );
  }
}
