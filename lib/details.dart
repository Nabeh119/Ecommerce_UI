import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  final data;
  const ItemDetails({super.key, this.data});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
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
      endDrawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        elevation: 0.0,
        backgroundColor: Colors.grey[200],
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shop_2_outlined,
                color: Colors.black,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Ecommerce",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Nabeh",
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Image.asset(
            widget.data['Image'],
            fit: BoxFit.cover,
          ),
          Container(
              child: Text(
            widget.data['title'],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.data['Description'],
            style: TextStyle(
              color: Colors.grey[700],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 25),
              child: Text(
                widget.data['price'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Color : ",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.orange,
                  ),
                ),
              ),
              Text("  Grey"),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(),
                ),
              ),
              Text("  Black"),
            ],
          ),
          Container(
              margin: EdgeInsets.all(20),
              child: Text(
                "Size : 34  35  40  41 ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                ),
              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: MaterialButton(
                color: Colors.black,
                textColor: Colors.white,
                onPressed: () {},
                child: Text("Add To Cart +"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
