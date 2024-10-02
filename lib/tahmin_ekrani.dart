import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmin_uygulamasi/sonuc_ekrani.dart';

class TahminEkrani extends StatefulWidget {
  
  const TahminEkrani({super.key});

  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {

  var tfcontroller = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "";
 @override
  void initState() {
    // TODO: implement initState
    rastgeleSayi = Random().nextInt(100);
    print("Rastgele sayi : $rastgeleSayi");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Hak Sayısı
             Text(
              "Kalan Hak: $kalanHak",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            //Yardım 
             Text(
              "Yardım: $yonlendirme",
              style:const TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            //Tahmin girdisi
            Padding(
              padding:const  EdgeInsets.all(20.0),
              child:  TextField(
                controller: tfcontroller,
                textAlign: TextAlign.center,
                decoration:const InputDecoration(labelText: "Tahmin",border: OutlineInputBorder() , ),
              ),
            ),
            //Tahmin Butonu
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  
                ),
                  onPressed: () {
                    
                    //Buton tıklandığında hak sayısı 1 azalır
                   setState(() {
                     kalanHak -= 1;
                   });
                   
                    int tahmin = int.parse(tfcontroller.text);
                     //Tahmin rastgele sayıya eşitse sonuc ekranina yönledirir
                     if(tahmin == rastgeleSayi){
                      Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const SonucEkrani(sonuc:true),
                      ),
                    );
                     }
                    if(tahmin < rastgeleSayi){
                      yonlendirme = "Tahmini Arttır";
                    }
                    if(tahmin > rastgeleSayi){
                      yonlendirme = "Tahmini Azalt";
                    }
                    
                    if(kalanHak == 0){
                      Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const SonucEkrani(sonuc: false,),
                      ),);
                    }

                  tfcontroller.text = "";

                  },
                  child: const Text("Tahmin Et",style: TextStyle(color: Colors.white , fontSize: 20),)),
            ),
          ],
        ),
      ),
    );
  }
}
