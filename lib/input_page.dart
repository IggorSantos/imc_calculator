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
 int height = 180;
 int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  ),
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
        child: ReusableCard(
          cor: Colors.amber,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
              'HEIGHT',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    height.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 60)
                  ),
                  Text(
                    'cm',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                    thumbColor: Colors.pink,
                    overlayColor: Colors.pink,
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: Colors.red,
                    inactiveColor: Colors.yellow,
                    onChanged: (double newValue){
                      setState(() {
                       height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
             ),
         ),
        ),
        Expanded(
        child: Container(
        child: Row(
          children: <Widget>[
          Expanded(
          child: ReusableCard(
            cor: Colors.amber,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Weight',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    weight.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 60),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(),
                      SizedBox(
                        width: 10,
                      ),
                      FloatingActionButton(
                        onPressed:(){
                          print("Funciona");
                        },
                        backgroundColor: Colors.yellow,
                        child:Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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

class RoundIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Colors.yellow,
      onPressed:(){
        print("Funciona");
      },
    );
  }
}
