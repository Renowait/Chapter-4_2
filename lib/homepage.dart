import 'dart:math';

import 'package:flutter/material.dart';


class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    var rnd = Random();

    return Scaffold(
      appBar: AppBar(
        title:  const Text('Product List'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        foregroundColor: const Color.fromARGB(255, 255, 60, 0),
      ),
      body: myGrid(context)
    );
  }

  Widget MyContainer(BuildContext context){
    return Container(
        width: 350,height: 500,
        color: Colors.lime,
        margin: const EdgeInsets.all(20),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://picsum.photos/id/200/300',
            fit:BoxFit.cover,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/ptd_dt',
                arguments: {'uri':'https://picsum.photos/id/200/300'}
                );
              }, 
              child: const Text('Detail'))
          ],
        ),
      );
  }

  Widget myGrid(BuildContext ctx){
      return GridView.builder(
        itemCount: 10,
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/4,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5), 
        itemBuilder: (ctx,index)=>ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: builTile(ctx,(index+1), (Random().nextInt(200)+50)),
        ));
    }

    Widget builTile(BuildContext ctx ,int index, int price) => GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text('Item no: $index'),
        subtitle: Text('Price: $price'),
        trailing: InkWell(
          child: const Icon(Icons.zoom_in,size: 32,color: Colors.white,),
          onTap: ()=>{
            Navigator.pushNamed(ctx, '/ptd_dt',
            arguments: {'id':index,'price':price}
            )
          },
        ),
      ),
      child: Image.network('https://picsum.photos/id/${index*9}/300',
            fit: BoxFit.cover,
      )
      );
}