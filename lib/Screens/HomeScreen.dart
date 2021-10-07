import 'package:badges/badges.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:second_project/Screens/CategoryScreen.dart';
import 'package:second_project/Screens/productDetails.dart';
import 'package:second_project/models/product.dart';
import 'package:second_project/providers/favProvid.dart';
import 'package:second_project/providers/themeproviders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  List categories = [
    'Burger',
    'butter chicken',
    'sandwhich',
    'chicken wings',
    'fish curry',
    'grilled chicken'
  ];
  List images = [
    'image/OIP.jpg',
    'image/20.jpg',
    'image/download.jpg',
    'image/50.jpg',
    'image/51.jpg',
    'image/21.jpg',
  ];
  List name = ['Beef Burger', 'DoubleBurger'];
  List type = ['Cheesy Mozarella', 'Double Beef'];
  List price = ['6.59 L.E', '7.49 L.E'];
  List picture = [
    'image/55.jpg',
    'image/56.jpg',
  ];
  List imageswiper = [
    'image/60.jpg',
    'image/61.jpg',
    'image/62.jpg',
    'image/63.jpg',
    'image/64.jpg',
  ];

  int selectedIndex = 0;
  List<Product> products = [
    Product(
      imgurl: 'image/55.jpg',
      name: 'Beef Burger',
      type: 'Cheesy Mozarella',
      price: '6.59 L.E',
    ),
    Product(
      imgurl: 'image/56.jpg',
      name: 'DoubleBurger',
      type: 'Double Beef',
      price: '7.49 L.E',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (i) {
          setState(() {
            selectedIndex = i;
          });
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.deepPurple,
        items: [
          BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'CartScreen');
                  },
                  child: Icon(Icons.home)),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'favScreen');
                  },
                  child: Icon(Icons.favorite)),
              label: 'fav'),
          BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'CartScreen');
                  },
                  child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'CartScreen');
                      },
                      child: Icon(Icons.shopping_cart))),
              label: 'cart'),
        ],
      ),
      key: scaffoldkey,
      drawer: Drawer(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    child: Text('Change Color'),
                    onPressed: () {
                      Provider.of<Themeprovider>(context, listen: false)
                          .changeTheme();
                    },
                  )),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      scaffoldkey.currentState.openDrawer();
                    },
                    child: Icon(Icons.list)),
                Badge(
                    badgeContent: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 6,
                      child: Text(
                        '0',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ),
                    position: BadgePosition(top: -8, end: -5),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'CartScreen');
                      },
                      child: Icon(
                        Icons.shopping_cart,
                        size: 40,
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300]),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      border: InputBorder.none),
                )),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'CategoryScreen');
            },
            child: Container(
              height: MediaQuery.of(context).size.height * .20,
              width: 100,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CategoryScreen(
                              categoryName: categories[index],
                              image: images[index],
                            );
                          }));
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(images[index]),
                                backgroundColor: Colors.white,
                              ),
                            ),
                            Text(categories[index]),
                          ],
                        ),
                      ));
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'New Arrival',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  'See All',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .50,
            child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return productDetails(
                          product: products[index],
                        );
                      }));
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Consumer<FavouriteList>(
                            builder: (context, favList, child) {
                          for (var procuct in favList.favList) {
                            if (procuct == products[index]) {
                              return InkWell(
                                onTap: () {
                                  favList.removeProduct(products[index]);
                                },
                                child: Badge(
                                  badgeContent: Icon(Icons.favorite),
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: Hero(
                                          tag: "image-${picture[index]}",
                                          child: Image(
                                            fit: BoxFit.cover,
                                            image: AssetImage(picture[index]),
                                            width: 180,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .50,
                                          ),
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .3,
                                        width: 270,
                                      ),
                                      Hero(
                                        tag: "name-${name[index]}",
                                        child: Text(
                                          name[index],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Hero(
                                        tag: "type-${type[index]}",
                                        child: Text(
                                          type[index],
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 15),
                                        ),
                                      ),
                                      Hero(
                                        tag: "price-${price[index]}",
                                        child: Text(
                                          price[index],
                                          style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          }
                          return InkWell(
                            onTap: () {
                              favList.addProduct(products[index]);
                            },
                            child: Badge(
                              badgeContent:
                              Icon(Icons.favorite_border_outlined),
                              child: Column(
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Hero(
                                      tag: "image-${picture[index]}",
                                      child: Image(
                                        image: AssetImage(picture[index]),
                                        width: 180,
                                        height: MediaQuery.of(context)
                                            .size
                                            .height *
                                            .50,
                                      ),
                                    ),
                                    height:
                                    MediaQuery.of(context).size.height *
                                        .3,
                                    width: 270,
                                  ),
                                  Hero(
                                    tag: "name-${name[index]}",
                                    child: Text(
                                      name[index],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Hero(
                                    tag: "type-${type[index]}",
                                    child: Text(
                                      type[index],
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                  ),
                                  Hero(
                                    tag: "price-${price[index]}",
                                    child: Text(
                                      price[index],
                                      style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        )
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * .30,
              child: Swiper(
                autoplay: true,
                pagination: SwiperPagination(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(imageswiper[index]),
                    )),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
