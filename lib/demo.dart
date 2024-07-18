// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// class CartProducts extends StatefulWidget {
//   @override
//   _CartProductsState createState() => _CartProductsState();
// }

// class _CartProductsState extends State<CartProducts> {
//   List<dynamic> silverpackages = [
//     // Example data
//     {"service_info": {"title": "Service 1", "price": 100}},
//     {"service_info": {"title": "Service 2", "price": 200}},
//   ];

//   int amount = 1350000;
//   int tax = 243000;
//   int totalAmount = 1593000;

//   void _deleteItem(int index) {
//     setState(() {
//       silverpackages.removeAt(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Cart Products"),
//         backgroundColor: Colors.orange,
//       ),
//       backgroundColor: Colors.amber[50],
//       body: Column(
//         children: [
//           Expanded(
//             child: silverpackages.isNotEmpty
//                 ? ListView.builder(
//                     itemCount: silverpackages.length,
//                     itemBuilder: (context, index) {
//                       final service = silverpackages[index];

//                       return Column(
//                         children: [
//                           SizedBox(height: 10),
//                           Slidable(
//                             endActionPane: ActionPane(
//                               motion: StretchMotion(),
//                               children: [
//                                 SlidableAction(
//                                   onPressed: (context) {
//                                     _deleteItem(index);
//                                   },
//                                   backgroundColor: Colors.red,
//                                   foregroundColor: Colors.white,
//                                   label: "Delete",
//                                   icon: Icons.delete,
//                                 ),
//                               ],
//                             ),
//                             child: Container(
//                               width: 400,
//                               height: 100,
//                               padding: const EdgeInsets.only(
//                                 top: 30,
//                                 left: 10,
//                                 right: 10,
//                               ),
//                               margin:
//                                   const EdgeInsets.symmetric(horizontal: 10),
//                               decoration: BoxDecoration(
//                                 color: Colors.blue.shade100,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: SingleChildScrollView(
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       children: [
//                                         Flexible(
//                                           child: Text(
//                                             service["service_info"]["title"] ??
//                                                 '',
//                                             maxLines: 2,
//                                             overflow: TextOverflow.ellipsis,
//                                             style: const TextStyle(
//                                                 fontSize: 13,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ),
//                                         const SizedBox(width: 10),
//                                         Row(
//                                           children: [
//                                             const Text(
//                                               '₹',
//                                               style: TextStyle(fontSize: 25),
//                                             ),
//                                             const SizedBox(width: 6),
//                                             Text(
//                                               service["service_info"]["price"]
//                                                       ?.toString() ??
//                                                   '0',
//                                               style: const TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight:
//                                                       FontWeight.bold),
//                                             ),
//                                             const SizedBox(width: 5),
//                                             const Text(
//                                               '/-',
//                                               style: TextStyle(fontSize: 25),
//                                             ),
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   )
//                 : const Center(child: CircularProgressIndicator()),
//           ),
//           Container(
//             width: 400,
//             height: 210,
//             margin: const EdgeInsets.symmetric(horizontal: 10),
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 245, 145, 39),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 10),
//                   Text(
//                     'Amount:                                $amount',
//                     style: const TextStyle(
//                         fontSize: 17, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     'Tax :                                       $tax',
//                     style: const TextStyle(
//                         fontSize: 17, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     'Total Amount:                       $totalAmount',
//                     style: const TextStyle(
//                         fontSize: 17, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 29),
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor:
//                           const Color.fromARGB(255, 246, 233, 190),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       minimumSize: const Size(319, 59),
//                     ),
//                     child: Text(
//                       "Pay $totalAmount",
//                       style: const TextStyle(color: Colors.black),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }
// }
