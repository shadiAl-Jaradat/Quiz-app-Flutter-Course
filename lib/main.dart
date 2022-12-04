import 'package:flutter/material.dart';


void main(){
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageOne(),
    );
  }
}




Map<String, String> questions = {
  'Q1' : 'Is Amman the capital city of Jordan ?',
  'Q2' : 'Dose the char have five legs ?',
  'Q3' : 'PSUT is one of the easiest uni in the world ? ',
  'Q4' : 'Racism is Good ? '
};

Map<String,bool> answers = {
  'Q1' : true,
  'Q2': false,
  'Q3' : false,
  'Q4' : false,
};



class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);
  @override
  State<PageOne> createState() => _PageOneState();
}



class _PageOneState extends State<PageOne> {
  int ct=1, score = 0;
  bool finish = false;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

     ButtonStyle buttonStyle(){
       return ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              side: const BorderSide(
                  width: 2,
                  color: Colors.white
              ),
              borderRadius: BorderRadius.circular(10)
          ),
          backgroundColor: Colors.transparent,
          fixedSize: Size(width * 0.65, height * 0.09),
          textStyle: const TextStyle(fontSize: 30 , fontWeight: FontWeight.bold ,)
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(54, 64, 108, 1),
      ),
      body: Container(
        height: height,
        width: width,
        color: const Color.fromRGBO(37, 44, 74, 1),
        child: Column(
          children: [


            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.05),
              child:  Text(
                finish == false ? "Question $ct" : "finish",
                style: const TextStyle(color: Colors.white,fontSize: 50),
              )
            ),

            Padding(
              padding:  EdgeInsets.only(bottom: height*0.05),
              child: Card(
                color: Colors.transparent,
                child: Container(
                  height: height * 0.17,
                  width: width * 0.85,
                  //padding: const EdgeInsets.all(15),
                  child: Center(
                    child:
                    finish == false ?
                    Text(
                      questions['Q$ct'] ?? "null",
                      style: const TextStyle(fontSize: 30 , color: Colors.white),
                      textAlign:TextAlign.center,
                    )
                    : Text(
                      "score : $score / 4",
                      style: const TextStyle(fontSize: 30 , color: Colors.white),
                      textAlign:TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),


            finish == false ?
            ElevatedButton(
                style: buttonStyle(),
                onPressed: (){
                  setState(() {
                    if(answers['Q$ct'] == true) score++;

                    ct++;

                    if(ct>4){
                      finish = true;
                    }
                  });
                },
                child: Text("True")
            )
            : Container(),


            finish == false  ?
            SizedBox(height: height * 0.03,)
            : Container(),


            finish == false ?
            ElevatedButton(
                style : buttonStyle(),
                onPressed: (){
                  setState(() {
                    if(answers['Q$ct']  == false) score++;
                    ct++;
                    if(ct>4){
                      finish = true;
                    }
                  });
                },
                child: Text("False")
            )
            :
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    backgroundColor: Colors.green,
                    fixedSize: Size(width * 0.75, height * 0.1),
                    textStyle: const TextStyle(fontSize: 30 , fontWeight: FontWeight.bold ,)
                ),
                onPressed: (){
                  setState(() {
                    ct=1;
                    score=0;
                    finish = false;
                  });
                },
                child: const Text(
                  'Reattempt',
                  //style: TextStyle(color: Colors.white , fontSize: 30),
                )
            )
          ],
        ),
      ),
    );
  }
}

