import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/state/cart.dart';
import '/state/count.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cart>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Provider App (${context.watch<Count>().count})'),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: cart.count,
        itemBuilder: (context, index, animation) {
          final item = cart.cart[index];
          return FadeTransition(
            opacity: animation,
            child: ListTile(
              title: Text(item),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cart.addItem('novo item ❤');
          _listKey.currentState?.insertItem(cart.count - 1);
        },
        tooltip: 'Adicionar novo item!',
        child: const Icon(Icons.add),
      ),
    );
  }
}
