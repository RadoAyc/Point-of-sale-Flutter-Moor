import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_v1/back-end/controllers/product_controller.dart';
import 'package:pos_v1/back-end/controllers/products_cobtroller.dart';
import 'package:pos_v1/back-end/controllers/search_form.dart';
import 'package:pos_v1/ui/utils/styles/input_style.dart';
import 'package:pos_v1/ui/utils/styles/text_style.dart';
import 'package:provider/provider.dart';

class AdminProductSearch extends StatefulWidget {
  const AdminProductSearch({Key key}) : super(key: key);

  @override
  _AdminProductSearchState createState() => _AdminProductSearchState();
}

class _AdminProductSearchState extends State<AdminProductSearch> {
  final _formKey = GlobalKey<FormState>();
  int reference;
  String designation = '';
  double prixAchat;
  double prixVente;

  List<String> _families = ['Allimentation', 'Boisson', 'Nettoyage', 'Divers'];
  List<String> _providers = [
    'Ahmed Elayachi',
    'Asddsd Looez',
    'LLaze 2',
    'Fournisseur 5'
  ]; // Option 2
  String _selectedFamilly; // Option 2
  String _selectedProvider; // Option 2

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductsController>(
      create: (context) => ProductsController(),
      child: Builder(
        builder: (context) {
          return Container(
            color: Color(0xffebd4d4),
            child: Wrap(
              // direction: Axis.vertical,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Form(
                    key: _formKey,
                    child: Wrap(
                      runSpacing: 10,
                      children: [
                        // SizedBox(height: 20.0)
                        Container(
                          child: Row(
                            // direction: Axis.horizontal,
                            // verticalDirection: ,
                            children: [
                              SizedBox(height: 20.0),
                              Flexible(
                                child: TextFormField(
                                  decoration: InputStyle.textInputDecoration
                                      .copyWith(labelText: 'Reference'),
                                  validator: (val) =>
                                      val.isEmpty ? 'Reference' : null,
                                  onChanged: (val) {
                                    setState(() => reference = int.parse(val));
                                  },
                                ),
                              ),
                              SizedBox(width: 20.0),
                              Flexible(
                                child: TextFormField(
                                  decoration: InputStyle.textInputDecoration
                                      .copyWith(labelText: 'Designation'),
                                  validator: (val) =>
                                      val.isEmpty ? 'Designation' : null,
                                  onChanged: (val) {
                                    setState(() => designation = val);
                                  },
                                ),
                              ),
                              SizedBox(width: 20.0),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      // style: TextStyle(
                                      //   color: Colors.white,
                                      // ),
                                      dropdownColor: Colors.white,
                                      hint: Text(
                                          'Famille :'), // Not necessary for Option 1
                                      value: _selectedFamilly,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedFamilly = newValue;
                                        });
                                      },
                                      items: _families.map((location) {
                                        return DropdownMenuItem(
                                          child: new Text(location),
                                          value: location,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      // style: TextStyle(
                                      //   color: Colors.white,
                                      // ),
                                      dropdownColor: Colors.white,
                                      hint: Text(
                                          'fournisseur :'), // Not necessary for Option 1
                                      value: _selectedProvider,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedProvider = newValue;
                                        });
                                      },
                                      items: _providers.map((provider) {
                                        return DropdownMenuItem(
                                          child: new Text(provider),
                                          value: provider,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   'Prix d\'achat :',
                                    //   style: TextsStyle.primaryTextStyle,
                                    // ),
                                    Container(
                                        child: Row(
                                      children: [
                                        Flexible(
                                          child: TextFormField(
                                            decoration: InputStyle
                                                .textInputDecoration
                                                .copyWith(
                                                    labelText:
                                                        'Prix d\'achat Min'),
                                            // validator: (val) =>
                                            //     val.isEmpty ? 'Designation' : null,
                                            onChanged: (val) {
                                              setState(() => prixAchat =
                                                  double.parse(val));
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 20.0),
                                        Flexible(
                                          child: TextFormField(
                                            decoration: InputStyle
                                                .textInputDecoration
                                                .copyWith(
                                                    labelText:
                                                        'Prix d\'achat Max'),
                                            // validator: (val) =>
                                            //     val.isEmpty ? 'Designation' : null,
                                            onChanged: (val) {
                                              setState(() => prixVente =
                                                  double.parse(val));
                                            },
                                          ),
                                        ),
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   'Prix de vente :',
                                    //   style: TextsStyle.primaryTextStyle,
                                    // ),
                                    Container(
                                        child: Row(
                                      children: [
                                        Flexible(
                                          child: TextFormField(
                                            decoration: InputStyle
                                                .textInputDecoration
                                                .copyWith(
                                                    labelText:
                                                        'Prix de vente Min'),
                                            // validator: (val) =>
                                            //     val.isEmpty ? 'Designation' : null,
                                            onChanged: (val) {
                                              setState(() => designation = val);
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 20.0),
                                        Flexible(
                                          child: TextFormField(
                                            decoration: InputStyle
                                                .textInputDecoration
                                                .copyWith(
                                                    labelText:
                                                        'Prix de vente Max'),
                                            // validator: (val) =>
                                            //     val.isEmpty ? 'Designation' : null,
                                            onChanged: (val) {
                                              setState(() => designation = val);
                                            },
                                          ),
                                        ),
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(height: 20.0),

                                  //SizedBox(height: 20.0),
                                  RaisedButton(
                                    color: Color(0xffffc93c),
                                    child: Text(
                                      'Rechercher',
                                      style: TextsStyle.primaryTextStyle
                                          .copyWith(color: Colors.black54),
                                    ),
                                    onPressed: () async {
                                      final SearchForm c =
                                          Get.put(SearchForm());
                                      // c.prixAchat = ..obs;
                                      // c.prixVente = prixVente..obs;
                                      final pructController =
                                          Get.put(PructController());
                                      pructController.prixAchat = prixAchat;
                                      pructController.prixVente = prixVente;

                                      print("recherch printed");
                                      print(pructController.prixAchat);
                                      print(pructController.prixVente);

                                      // final p =
                                      //     Provider.of<ProductsController>(
                                      //         context,
                                      //         listen: false);
                                      // p.prixAchatmin = prixAchat;
                                      // p.prixAchatmax = prixVente;
                                      // if (_formKey.currentState
                                      //     .validate()) {
                                      //   //setState(() => loading = true);
                                      //   // dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                      //   // if (result == null) {
                                      //   //   setState(() {
                                      //   //     loading = false;
                                      //   //     error = 'Please enter a valid email';
                                      //   //   });
                                      //   // }
                                      // }
                                    },
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                        SizedBox(width: 20.0),

                        SizedBox(width: 20.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
