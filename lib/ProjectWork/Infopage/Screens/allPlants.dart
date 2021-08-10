import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'trendingplants.dart';
List plants = [
  {
    "img": "assets/vege13.jpg",
    "title": "Tiny Tim Tomato",
    "address": "Popular Food to make with: Tomato Soup",
    "rating": "9.5"
  },
  {
    "img": "assets/vege14.jpg",
    "title": "Thai Basil",
    "address": "Popular Food to make with: Thai Basil Chicken",
    "rating": "8.0"
  },
  {
    "img": "assets/vege15.jpg",
    "title": "Orange",
    "address": "Popular Food to make with: Orange Cake",
    "rating": "9.0"
  },
  {
    "img": "assets/vege16.jpg",
    "title": "Carrot",
    "address": "Popular Food to make with: Honey garlic roasted carrot",
    "rating": "9.5"
  },
  {
    "img": "assets/vege17.jpg",
    "title": "Potato",
    "address": "Popular Food to make with: Garlic roasted potato",
    "rating": "9.5"
  },
  {
    "img": "assets/vege18.jpg",
    "title": "Strawberry",
    "address": "Popular Food to make with: Strawberry juice",
    "rating": "10.0"
  },
  {
    "img": "assets/vege19.jpg",
    "title": "Lettuce",
    "address": "Popular Food to make with: Salad",
    "rating": "9.0"
  },
  {
    "img": "assets/vege20.jpg",
    "title": "Burpee Bush Tomato",
    "address": "Popular Food to make with: ",
    "rating": "9.5"
  },
  {
    "img": "assets/vege21.jpg",
    "title": "Micro Tom Tomato",
    "address": "Popular Food to make with: Salad",
    "rating": "9.5"
  },
  {
    "img": "assets/vege2.jpg",
    "title": "Kale",
    "address": "Popular Food to make with: Salad",
    "rating": "7.5"
  },

];
class AllPlants extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Tap to add plants"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10.0,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: plants == null ? 0 : plants.length,
              itemBuilder: (BuildContext context, int index) {
                Map restaurant = plants[index];
                return Trendingplant(
                  img: restaurant["img"],
                  title: restaurant["title"],
                  address: restaurant["address"],
                  rating: restaurant["rating"],
                );
              },
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
