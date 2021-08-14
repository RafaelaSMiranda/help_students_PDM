// import 'package:flutter/material.dart';
// import 'package:help_students/providers/tarefa.dart';
// import 'package:help_students/utils/app_routes.dart';
// import 'package:provider/provider.dart';


// class InserirTarefa extends StatelessWidget {
//   final Tarefa product;

//   InserirTarefa(this.product);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: CircleAvatar(
//         backgroundImage: NetworkImage(product.imageUrl),
//       ),
//       title: Text(product.title),
//       trailing: Container(
//         width: 100,
//         child: Row(
//           children: <Widget>[
//             IconButton(
//               icon: Icon(Icons.edit),
//               color: Theme.of(context).primaryColor,
//               onPressed: () {
//                 Navigator.of(context)
//                     .pushNamed(AppRoutes.PRODUCT_FORM, arguments: product);
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.delete),
//               color: Theme.of(context).errorColor,
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (ctx) => AlertDialog(
//                     title: Text('Excluir Produto'),
//                     content: Text('Tem certeza?'),
//                     actions: <Widget>[
//                       TextButton(
//                         child: Text('Não'),
//                         onPressed: () => Navigator.of(context).pop(false),
//                       ),
//                       TextButton(
//                         child: Text('Sim'),
//                         onPressed: () => Navigator.of(context).pop(true),
//                       ),
//                     ],
//                   ),
//                 ).then((value) async {
//                   if (value) {
//                     try {
//                       await Provider.of<Products>(context, listen: false)
//                           .deleteProduct(product.id);
//                     } on HttpException catch (error) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text(error.toString()),
//                         ),
//                       );
//                     }
//                   }
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
