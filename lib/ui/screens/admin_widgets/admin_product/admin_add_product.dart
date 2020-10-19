import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/instance_manager.dart';
import 'package:pos_v1/back-end/data/moor_database.dart';
import 'package:pos_v1/ui/screens/admin_widgets/admin_product/admin_product_show.dart';
import 'package:pos_v1/ui/utils/size_config.dart';
import 'package:pos_v1/ui/utils/styles/input_style.dart';
import 'package:pos_v1/ui/utils/styles/text_style.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class AdminAddProduct extends StatefulWidget {
  @override
  _AdminAddProductState createState() => _AdminAddProductState();
}

class _AdminAddProductState extends State<AdminAddProduct> {
  final _formKey = GlobalKey<FormState>();

  int reference;
  String designation = '';
  int quantite;
  double tva;
  double prixAchat;
  double prixVente;
  // Drop List

  List<String> _families = ['Allimentation', 'Boisson', 'Nettoyage', 'Divers'];
  List<String> _providers = [
    'Ahmed Elayachi',
    'Asddsd Looez',
    'LLaze 2',
    'Fournisseur 5'
  ]; // Option 2
  String _selectedFamilly; // Option 2
  String _selectedProvider; // Option 2

  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xffffbb91),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: 50,
              // ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: SizeConfig.screenWidth / 2,
                  color: Color(0xffff8e6e),
                  padding: EdgeInsets.all(10),
                  child: Wrap(
                    // alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    runSpacing: 20,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Form(
                        key: _formKey,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          runSpacing: 10,
                          children: [
                            Text(
                              'Nouveau Produit',
                              style: TextsStyle.primaryTextStyle
                                  .copyWith(fontSize: 20),
                            ),
                            TextFormField(
                              controller: controller,
                              decoration: InputStyle.textInputDecoration
                                  .copyWith(hintText: 'Référence'),
                              validator: (val) =>
                                  val.isEmpty ? 'Champ obligatoire' : null,
                              onChanged: (val) {
                                setState(() => reference = int.parse(val));
                              },
                            ),
                            TextFormField(
                              controller: controller,
                              decoration: InputStyle.textInputDecoration
                                  .copyWith(hintText: 'Désignation'),
                              validator: (val) =>
                                  val.isEmpty ? 'Champ obligatoire' : null,
                              onChanged: (val) {
                                setState(() => designation = val);
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Wrap(
                                    runSpacing: 10,
                                    children: [
                                      TextFormField(
                                        controller: controller,
                                        decoration: InputStyle
                                            .textInputDecoration
                                            .copyWith(hintText: 'Quantité'),
                                        // validator: (val) => val.isEmpty
                                        //     ? 'Champ obligatoire'
                                        //     : null,
                                        onChanged: (val) {
                                          setState(
                                              () => quantite = int.parse(val));
                                        },
                                      ),
                                      TextFormField(
                                        controller: controller,
                                        decoration: InputStyle
                                            .textInputDecoration
                                            .copyWith(hintText: 'TVA')
                                            .copyWith(
                                                suffixIcon: Center(
                                                    widthFactor: 0,
                                                    child: FaIcon(
                                                        FontAwesomeIcons
                                                            .percent))),
                                        // validator: (val) => val.isEmpty
                                        //     ? 'Champ obligatoire'
                                        //     : null,
                                        onChanged: (val) {
                                          setState(
                                              () => tva = double.parse(val));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Wrap(
                                    runSpacing: 10,
                                    children: [
                                      TextFormField(
                                        controller: controller,
                                        decoration: InputStyle
                                            .textInputDecoration
                                            .copyWith(
                                                hintText: 'prix d\'achat'),
                                        validator: (val) => val.isEmpty
                                            ? 'Champ obligatoire'
                                            : null,
                                        onChanged: (val) {
                                          setState(() =>
                                              prixAchat = double.parse(val));
                                        },
                                      ),
                                      TextFormField(
                                        controller: controller,
                                        decoration: InputStyle
                                            .textInputDecoration
                                            .copyWith(
                                                hintText: 'Prix de vente'),
                                        validator: (val) => val.isEmpty
                                            ? 'Champ obligatoire'
                                            : null,
                                        onChanged: (val) {
                                          setState(() =>
                                              prixVente = double.parse(val));
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              child: Wrap(
                                runSpacing: 10,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
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
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
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
                                  Row(
                                    children: [
                                      Expanded(
                                        child: RaisedButton(
                                          padding: EdgeInsets.all(10),
                                          color: Colors.white,
                                          child: Text('Ajouter une famille',
                                              style: TextsStyle.primaryTextStyle
                                              // .copyWith(color: Color(0xfff6f6f6)),
                                              ),
                                          onPressed: () async {
                                            if (_formKey.currentState
                                                .validate()) {
                                              //setState(() => loading = true);
                                              // dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                              // if (result == null) {
                                              //   setState(() {
                                              //     loading = false;
                                              //     error = 'Please enter a valid email';
                                              //   });
                                              // }
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: RaisedButton(
                                          padding: EdgeInsets.all(10),
                                          color: Colors.white,
                                          child: Text('Ajouter un fournisseur',
                                              style: TextsStyle.primaryTextStyle
                                              // .copyWith(color: Color(0xfff6f6f6)),
                                              ),
                                          onPressed: () async {
                                            if (_formKey.currentState
                                                .validate()) {
                                              //setState(() => loading = true);
                                              // dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                              // if (result == null) {
                                              //   setState(() {
                                              //     loading = false;
                                              //     error = 'Please enter a valid email';
                                              //   });
                                              // }
                                            }
                                          },
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            RaisedButton(
                              padding: EdgeInsets.all(10),
                              color: Color(0xff515070),
                              child: Text(
                                'Ajouter',
                                style: TextsStyle.primaryTextStyle
                                    .copyWith(color: Color(0xfff6f6f6)),
                              ),
                              onPressed: () async {
                                final dao = Provider.of<ProductDao>(context,
                                    listen: false);

                                //resetValuesAfterSubmit();
                                if (_formKey.currentState.validate()) {
                                  final product = Product(
                                    reference: reference,
                                    designation: designation,
                                    quantite: quantite,
                                    prixAchat: prixAchat,
                                    prixVente: prixVente,
                                    tva: tva,
                                    famille: _selectedFamilly,
                                    fournisseur: _selectedProvider,
                                  );
                                  dao.insertProduct(product);
                                  _formKey.currentState.reset();

                                  //setState(() => loading = true);
                                  // dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                  // if (result == null) {
                                  //   setState(() {
                                  //     loading = false;
                                  //     error = 'Please enter a valid email';
                                  //   });
                                  // }
                                }
                              },
                            ),
                            RaisedButton(
                              padding: EdgeInsets.all(10),
                              color: Colors.white,
                              child: Text('Show products',
                                  style: TextsStyle.primaryTextStyle
                                  // .copyWith(color: Color(0xfff6f6f6)),
                                  ),
                              onPressed: () async {
                                Get.to(ShowProduct());
                                if (_formKey.currentState.validate()) {
                                  //setState(() => loading = true);
                                  // dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                  // if (result == null) {
                                  //   setState(() {
                                  //     loading = false;
                                  //     error = 'Please enter a valid email';
                                  //   });
                                  // }
                                }
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void resetValuesAfterSubmit() {
    setState(() {
      // newTaskDate = null;
      controller.clear();
    });
  }
}
