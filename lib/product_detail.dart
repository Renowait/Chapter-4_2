import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    var id = args['id'];
    var price = args['price'];

    return Scaffold(
       appBar: AppBar(
        title:  const Text('Product Detail'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        foregroundColor: const Color.fromARGB(255, 255, 60, 0),
      ),
      body: myDisplay(context, id, price)
    );
  }

  Widget detail() => Container(
    alignment:Alignment.centerLeft,
    padding: const EdgeInsets.all(16),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16,),
        Text('นี่คือรูปของคนที่ชื่อมิ้ม',style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
        SizedBox(height: 8),
          Text(
            'เป็นสัตว์สงวน\n '
            'ถูกคุ้มครอง',
            style: TextStyle(fontSize: 16),
          ),
      ],
    )
  );

  Widget showPrice(int id,int price) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Item no. $id'),
          Text('Price: \$$price')
        ],
      ),
      const Row(mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.add_shopping_cart, color: Colors.blue, size: 36,)
        ],
      )
    ],
  );

  Widget myDisplay(BuildContext ctx,int id,int price){
    return  SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network('https://picsum.photos/id/${id*9}/1000',fit: BoxFit.cover,),
            ),
            const SizedBox(height: 15,),
            showPrice(id,price),
            const SizedBox(height: 15,),
            detail()
          ],        
          ),
    );
  }

Widget myContainer(BuildContext context ,int id) {
  return Container(
        
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //ClipRRect(
              //borderRadius: BorderRadius.circular(30),
              Image.network('https://picsum.photos/id/${id*9}/1000',fit: BoxFit.cover,
            //),
            ),
            const SizedBox(height: 15),
            detail(),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 61, 61, 61),
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/',
                arguments: {'uri':'https://picsum.photos/id/200/300'}
                );
              }, 
              child: const Text('<< Back'))
          ],
        ),
      );
}
}

