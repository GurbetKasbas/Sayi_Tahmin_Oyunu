import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  final bool sonuc;
 const SonucEkrani({required this.sonuc});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 300,
              child: widget.sonuc ? Image.asset("assets/images/mutlu.jpg") : Image.asset("assets/images/mutsuz.jpg")),
            Text(widget.sonuc ? "Kazandınız"  : "Kazanamadınız", 
            style: widget.sonuc ? const TextStyle(color: Colors.green, fontSize: 30 ,fontWeight: FontWeight.bold) : const TextStyle(color: Colors.red, fontSize: 30 ,fontWeight: FontWeight.bold)) ,
               
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    
                  ),
                onPressed: (){
                  Navigator.of(context).popUntil((route) => route.isFirst);
                }, 
              child:const Text("Tekrar Dene",style: TextStyle(color: Colors.white , fontSize: 20))),
            )
          ],
        ),
      ),
    );
  }
}