import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedCategory = 0;

  List<String> categories = ["Trending", "Coming Soon", "Finished"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 60,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        //Category Tile
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = index;
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categories[index],
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.w600,
                      color: index == selectedCategory
                          ? Colors.black
                          : Colors.black.withOpacity(0.4)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 6,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index == selectedCategory
                          ? Colors.red
                          : Colors.transparent),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
