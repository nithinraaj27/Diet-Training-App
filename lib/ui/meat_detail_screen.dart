import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'meal.dart';



class MealsDetailScreen extends StatelessWidget {

  final Meal meal;

  const MealsDetailScreen({Key key, this.meal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAAD0D2),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: true,
            floating: true,
            backgroundColor: const Color(0xFf200087),
            expandedHeight: 300,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
                  child: Image.asset(
                    meal.imagePath,fit: BoxFit.cover,
                  )
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 20,),
                  ListTile(
                    title: Text(
                      meal.mealTime.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                          color: Colors.black54
                      ),
                    ),
                    subtitle: Text(
                      meal.name.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.black87
                      ),
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.access_time,color: Colors.black,),
                            SizedBox(width: 30,),
                            Text("${meal.kiloCaloriesBurnt} kcal",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                              ),)
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.shutter_speed,color: Colors.black,),
                            SizedBox(width: 5,),
                            Text("${meal.timeTaken} mins",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16
                              ),)
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "INGRIDIENTS",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.blueGrey
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for(int i=0; i<meal.ingredients.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              meal.ingredients[i],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300
                              ),
                            ),
                          ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "PREPARATIONS",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.blueGrey
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16,right: 16,bottom: 32),
                          child: Text(
                            meal.preparation,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]
              )
          )
        ],
      ),
    );
  }
}
