import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  static const routeName = '/ShoppingCart';

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final List<Map<String, dynamic>> _cartItems = [
    {'name': 'Apple', 'price': 3.0, 'quantity': 2},
    {'name': 'Banana', 'price': 1.5, 'quantity': 3},
    {'name': 'Milk', 'price': 2.5, 'quantity': 1},
  ];

  double calculateTotal() {
    return _cartItems.fold(
      0.0,
          (sum, item) => sum + item['price'] * item['quantity'],
    );
  }

  void updateQuantity(int index, bool increment) {
    setState(() {
      if (increment) {
        _cartItems[index]['quantity']++;
      } else {
        if (_cartItems[index]['quantity'] > 1) {
          _cartItems[index]['quantity']--;
        } else {
          _cartItems.removeAt(index);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: _cartItems.isEmpty
          ? const Center(
        child: Text('Your cart is empty!'),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text('Price: \$${item['price']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle),
                        onPressed: () => updateQuantity(index, false),
                      ),
                      Text('${item['quantity']}'),
                      IconButton(
                        icon: const Icon(Icons.add_circle),
                        onPressed: () => updateQuantity(index, true),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total: \$${calculateTotal().toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Proceeding to Payment...')),
                    );
                  },
                  child: const Text('Proceed to Payment'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}