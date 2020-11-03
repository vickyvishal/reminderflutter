import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  //final means the question text doesnt change inside this class as it is stateless. Makes it clear and robust
  //still not checking the type during development(like typescript)! why?!?!

  Question(
    this.questionText,
  ); //like constructor, this assigns the first parameter to questionText
  //this is postional argument, since only one parameter to assign, its easier. Named argument is more precise
  //use named argument by wrapping in {} when we have more than one args
  //receive props with type, better than react(Typescript is great)
  @override
  Widget build(BuildContext context) {
    //like render in react component class
    //questionText = "lol"//not possbile because its final
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
