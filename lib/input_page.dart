import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'reusable_widget.dart';

const Color activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);

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
 int age = 10;

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
          cor: activeCardColor,
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
            cor: activeCardColor,
              cardChild: Expanded(
                child: Column(
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
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        RawMaterialButton(
                          child: Icon(Icons.remove),
                          elevation: 0,
                          constraints: BoxConstraints.tightFor(
                            width: 56,
                            height: 56,
                          ),
                          shape: CircleBorder(),
                          fillColor: Colors.amber,
                          onPressed: (){
                            setState((){
                              weight = weight - 1;
                            });
                          }
                        ),
                          SizedBox(
                            width: 10,
                          ),
                          RawMaterialButton(
                            child: Icon(Icons.add),
                            elevation: 0,
                            constraints: BoxConstraints.tightFor(
                              width: 56,
                              height: 56,
                            ),
                            shape: CircleBorder(),
                            fillColor: Colors.amber,
                            onPressed: (){
                            setState((){
                              weight = weight + 1;
                            });
                            }
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
          child:ReusableCard(
          cor: activeCardColor,
            cardChild: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Age',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    age.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 60),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      RawMaterialButton(
                        child: Icon(Icons.remove),
                        elevation: 0,
                        constraints: BoxConstraints.tightFor(
                          width: 56,
                          height: 56,
                        ),
                        shape: CircleBorder(),
                        fillColor: Colors.amber,
                        onPressed: (){
                          setState((){
                            age = age - 1;
                          });
                        }
                      ),
                        SizedBox(
                          width: 10,
                        ),
                        RawMaterialButton(
                          child: Icon(Icons.add),
                          elevation: 0,
                          constraints: BoxConstraints.tightFor(
                            width: 56,
                            height: 56,
                          ),
                          shape: CircleBorder(),
                          fillColor: Colors.amber,
                          onPressed: (){
                            setState((){
                              age = age + 1;
                            });
                          }
                        ),
                      ],
                    ),
                  ),
                ],
              ),
             ),
            ),
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
