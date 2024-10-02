import 'package:flutter/material.dart';
import 'package:sayi_tahmin_uygulamasi/tahmin_ekrani.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Başlık
           const  Text("Tahmin Oyunu",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 5
            ),
            ),
            //Görsel
            Image.asset("assets/images/zar.jpg"),
            //Button
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const  TahminEkrani()));
                }, 
                child: const Text("Oyuna Başla" , style: TextStyle(color: Colors.white , fontSize: 20), )),
            )
          ],
        ),
      ),
    );
  }
}