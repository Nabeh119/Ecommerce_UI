import 'package:ecommerce_ui/details.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List categories = [
    {
      "iconName": Icons.laptop,
      "title": "Laptop",
    },
    {
      "iconName": Icons.phone_android,
      "title": "Mobile",
    },
    {
      "iconName": Icons.electric_bike,
      "title": "Bikes",
    },
    {
      "iconName": Icons.card_giftcard,
      "title": "Gifts",
    },
    {
      "iconName": Icons.electric_car,
      "title": "Cars",
    },
  ];

  List Items = [
    {
      "Image": "assets/3.jpg",
      "title": "Wirless HeadPhone",
      "Description": "Havoc Gaming Headphone",
      "price": "1800\$",
    },
    {
      "Image": "assets/4.jpg",
      "title": "Watch",
      "Description":
          "The best Apple Watch 2026: Top smartwatches to use with iOS phones",
      "price": "499\$",
    },
    {
      "Image": "assets/1.jpg",
      "title": "Wirless HeadPhone",
      "Description": "Description HeadPhone is good",
      "price": "350\$",
    },
    {
      "Image": "assets/2.jpg",
      "title": "Watch",
      "Description": "Description Watch casio IP68",
      "price": "150\$",
    }
  ];

  int selectindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectindex = value;
          });
        },
        currentIndex: selectindex,
        iconSize: 40,
        selectedItemColor: Colors.orange,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "",
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search_rounded,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.menu,
                    size: 40,
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Categories",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Icon(
                              categories[i]["iconName"] as IconData,
                              size: 40,
                            ),
                            //color: Colors.grey[200],
                          ),
                        ),
                        Text(
                          categories[i]['title'].toString(),
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Best Selling",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 250,
              ),
              itemCount: Items.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ItemDetails(
                            //هذه الصفحة تستقبل بيانات المنتج من شاشة
                            data: Items[index], //فكرة جميلة
                          );
                        },
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // padding: EdgeInsets.all(20),
                          width: 300,
                          color: Colors.grey[200],
                          child: Image.asset(
                            "${Items[index]["Image"]}",
                            height: 110,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          "${Items[index]["title"]}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "${Items[index]["Description"]}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${Items[index]["price"]}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
