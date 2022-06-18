import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'reusable_widget.dart';

const activeCardColor = Colors.yellow;
const inactiveCardColor = Colors.amber;

enum GenderType {
  male,
  female,
  begin,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
 GenderType selectedGender = GenderType.begin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
            Expanded(
            child: Container(
            child: Row(
              children: <Widget>[
              Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    selectedGender = GenderType.male;
                  });
                },
                child: ReusableCard(
                  cor: selectedGender == GenderType.male ? activeCardColor : inactiveCardColor,
                  cardChild: ReusableWidget(
                    icon: Icons.call_made,
                    label: 'MALE',
                  )
                ),
              ),
            ),
            Expanded(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  selectedGender = GenderType.female;
                });
              },
              child:ReusableCard(
                cor: selectedGender == GenderType.female ? activeCardColor : inactiveCardColor,
                cardChild: ReusableWidget(
                  icon: Icons.add,
                  label: 'FEMALE',
                ),
              ),
            ),
           ),
          ],
         ),
        ),
      ),
        Expanded(
        child: ReusableCard(cor: Colors.amber),
        ),
        Expanded(
        child: Container(
        child: Row(
          children: <Widget>[
          Expanded(
          child: ReusableCard(cor: Colors.amber),
          ),
          Expanded(
          child:ReusableCard(cor: Colors.amber),
           ),
          ],
         ),
        ),
      ),
     ],
    )

   );
  }
}
