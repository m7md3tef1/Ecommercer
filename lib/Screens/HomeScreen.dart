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
  List categories = ['Shirts', 'Watchs', 'Bags', 'Shoes', 'Coats', 'Trouser'];
  List images = [
    'image/gettyimages-953147038-612x612.jpg',
    'image/IW503605_tile_1.717.jpg.transform.article_image_335_2x.webp',
    'image/A411FC1X25_2586_2F.jpg',
    'image/1 (2).jpg',
    'image/1 (1).jpg',
    'image/download.jpg',
  ];
  List name = ['jorden', 'Oleves'];
  List type = ['jorden Nike', 'Classic WatchMer'];
  List price = ['700 L.E', '4500 L.E'];
  List picture = [
    'image/5.jpg',
    'image/IW503605_tile_1.717.jpg.transform.article_image_335_2x.webp',
  ];
  List imageswiper = [
    'image/Shop6.jpg',
    'image/Shop7.jpg',
    'image/Shop8.jpg',
    'image/Shop9.jpg',
    'image/Shop10.jpg',
  ];

  int selectedIndex =0;
  List<Product> products=[
    Product(imgurl:'image/5.jpg' ,name: 'jorden',type: 'jorden Nike',price: '700 L.E', ),
    Product(imgurl:'image/IW503605_tile_1.717.jpg.transform.article_image_335_2x.webp',name: 'Oleves',type: 'Classic WatchMer',price: '4500 L.E', ),
  ] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (i)
        {
          setState(() {
            selectedIndex=i;
          });
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.deepPurple,
        items: [
          BottomNavigationBarItem(icon: InkWell(
            onTap: ()
            {
              Navigator.pushNamed(context, 'CartScreen');
            },
              child: Icon(Icons.home)),label:'Home' ),
          BottomNavigationBarItem( icon:InkWell(
            onTap: (){
              Navigator.pushNamed(context, 'favScreen');
            },
              child: Icon(Icons.favorite)),label:'fav'),
          BottomNavigationBarItem( icon:
          InkWell(
            onTap: ()
            {
              Navigator.pushNamed(context, 'CartScreen');
            },
              child: InkWell(
                  onTap:()
                  {
                     Navigator.pushNamed(context, 'CartScreen');
                  }
                  ,child: Icon(Icons.shopping_cart))),label:'cart'),

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
               child: TextButton(child: Text('Change Color'),
                   onPressed:()
                   {
                     Provider.of<Themeprovider>(context,listen: false).changeTheme();
                   },

             )
             ),
           )],
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
                      radius: 8,
                      child: Text('0',style: TextStyle(color: Colors.black),),
                    ),
                    position: BadgePosition(top: -9, end: -5),
                    child: InkWell(
                      onTap: (){
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
            height: MediaQuery.of(context).size.height * .40,
            child: ListView.builder(
                itemCount:name.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
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
                              builder: (context,favList,child)
                              { for(var procuct in favList.favList)
                              {
                                if(procuct ==products[index])
                                {
                                  return     InkWell(
                                    onTap: (){
                                      favList.removeProduct(products[index]);
                                    },
                                    child: Badge(
                                      badgeContent: Icon(Icons.favorite

                                      ),
                                        child: Column(
                                          children: [
                                            Container(
                                              color: Colors.white,
                                              child: Image(
                                                image: AssetImage(picture[index]),
                                                width: 100,
                                                height: MediaQuery.of(context).size.height * .30,
                                              ),
                                              height: MediaQuery.of(context).size.height * .2,
                                              width: 210,
                                            ),
                                            Text(
                                              name[index],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              type[index],
                                              style: TextStyle(color: Colors.grey, fontSize: 15),
                                            ),
                                            Text(
                                              price[index],
                                              style:
                                              TextStyle(color: Colors.deepPurple, fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),

                                  );

                                }

                              }

                              return   InkWell(
                                onTap: (){
                                  favList.addProduct(products[index]);
                                },
                                child: Badge(
                                  badgeContent: Icon(Icons.favorite_border

                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: Image(
                                          image: AssetImage(picture[index]),
                                          width: 100,
                                          height: MediaQuery.of(context).size.height * .30,
                                        ),
                                        height: MediaQuery.of(context).size.height * .2,
                                        width: 210,
                                      ),
                                      Text(
                                        name[index],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        type[index],
                                        style: TextStyle(color: Colors.grey, fontSize: 15),
                                      ),
                                      Text(
                                        price[index],
                                        style:
                                        TextStyle(color: Colors.deepPurple, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              );




                              }

                       ),
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
