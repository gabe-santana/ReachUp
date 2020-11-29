import 'package:ReachUp/Component/Dialog/CustomDialog.component.dart';
import 'package:ReachUp/Controller/Local.controller.dart';
import 'package:ReachUp/Controller/SubCategory.controller.dart';
import 'package:ReachUp/Model/Category.model.dart';
import 'package:ReachUp/Model/Subcategory.model.dart';
import 'package:ReachUp/Repositories/Local.repository.dart';
import 'package:ReachUp/Repositories/SubCategory.repository.dart';
import 'package:ReachUp/globals.dart';
import 'package:ReachUp/main.dart';
import 'package:async/async.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'AddSubCategoryToStore.view.dart';
import 'EditStore.view.dart';

class StoreView extends StatefulWidget {
  @override
  _StoreViewState createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  SubCategoryController subCategoryController = new SubCategoryController();
  final LocalController _localController = new LocalController();

  AsyncMemoizer _memoizer;
  @override
  initState() {
    // _categoryController.getAll().then((value) => () {
    //       categories = value;
    //     });
    super.initState();
    _memoizer = AsyncMemoizer();
  }

  buildlistView() {
    _memoizer.runOnce(() {
      EasyLoading.show(status: "Carregando...");
      subCategoryController
          .getByLocal(Globals.user.admLocal.idLocal)
          .then((value) {
        EasyLoading.dismiss();
        setState(() {
          Globals.subcategoriesLocal = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        CachedNetworkImage(
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
          httpHeaders: {"Authorization": "Bearer ${Globals.user.token}"},
          imageUrl: LocalRepository().getImage(Globals.user.admLocal),
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.grey)),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Card(
          child: InkWell(
            onTap: () {},
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Theme.of(context).colorScheme.onBackground,
                          size: 30,
                        ),
                        onPressed: () {
                          navigateTo(
                              EditSoreView(),
                              "Editar loja",
                              "Aqui você poderá editar os dados referentes a sua loja",
                              context,
                              true);
                        })),
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                              child: Container(
                                  child: Text(Globals.user.admLocal.name,
                                      style: TextStyle(
                                        fontSize: 19,
                                      ))),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: FaIcon(
                                      FontAwesomeIcons.mapMarkedAlt,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  Text(
                                    Globals.user.admLocal.floor == 0
                                        ? "Térreo"
                                        : "${Globals.user.admLocal.floor}º Andar",
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: FaIcon(FontAwesomeIcons.clock,
                                        color: Colors.green),
                                  ),
                                  Text(
                                    "Abre às: ${Globals.user.admLocal.openingHour}",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.green),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: FaIcon(
                                      FontAwesomeIcons.clock,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Text(
                                    "Fecha às: ${Globals.user.admLocal.closingHour}",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.red),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Stack(
          children: [
            Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Container(
                              color: Colors.transparent,
                              child: Text("Subcategorias",
                                  style: TextStyle(
                                    fontSize: 19,
                                  ))),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              height: 300,
              child: Builder(builder: (context) {
                buildlistView();
                return ListView.builder(
                   physics: BouncingScrollPhysics(),
                    itemCount: Globals.subcategoriesLocal.length,
                    itemBuilder: (context, index) => ListTile(
                          trailing: IconButton(
                            tooltip:
                                "Deletar ${Globals.subcategoriesLocal[index].category.categoryName} ${Globals.subcategoriesLocal[index].subCategoryName}",
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CustomDialog(
                                        icon: Icons.delete,
                                        title: "Deletar",
                                        description:
                                            "Deletar ${Globals.subcategoriesLocal[index].subCategoryName} em ${Globals.subcategoriesLocal[index].category.categoryName} ?",
                                        buttonOK: RaisedButton(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error,
                                          onPressed: () {
                                            EasyLoading.show(
                                                status: "Deletando...");
                                            _localController
                                                .deleteSubCategory(
                                                    Globals
                                                        .user.admLocal.idLocal,
                                                    Globals
                                                        .subcategoriesLocal[
                                                            index]
                                                        .category
                                                        .categoryId,
                                                    Globals
                                                        .subcategoriesLocal[
                                                            index]
                                                        .subCategoryId)
                                                .then((value) {
                                              EasyLoading.dismiss();
                                              setState(() {
                                                Globals.subcategoriesLocal
                                                    .removeAt(index);
                                              });
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Text(
                                            "Deletar",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        buttonNO: FlatButton(
                                          color: Colors.transparent,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Cancelar",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground),
                                          ),
                                        ),
                                      ));
                            },
                            icon: Icon(Icons.delete,
                                color: Theme.of(context).colorScheme.error),
                          ),
                          title: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    width: MediaQuery.of(context).size.width,
                                    httpHeaders: {
                                      "Authorization":
                                          "Bearer ${Globals.user.token}"
                                    },
                                    imageUrl: SubCategoryRepository().getImage(
                                        Globals.subcategoriesLocal[index]
                                            .category.categoryId,
                                        Globals.subcategoriesLocal[index]
                                            .subCategoryId),
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(
                                          valueColor:
                                              new AlwaysStoppedAnimation<Color>(
                                                  Colors.grey)),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "${Globals.subcategoriesLocal[index].category.categoryName}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        fontSize: 16),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(
                                      "${Globals.subcategoriesLocal[index].subCategoryName}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ));
              }),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 25,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.add),
                  color: Colors.white,
                  onPressed: () {
                    navigateTo(
                            AddSubCategoryToStoreView(),
                            "SubCategorias",
                            "Aqui você pode adicionar subcategorias a sua loja!",
                            context,
                            false)
                        .then((value) {
                      setState(() {
                        EasyLoading.show(status: "Carregando...");
                        subCategoryController
                            .getByLocal(Globals.user.admLocal.idLocal)
                            .then((value) {
                          EasyLoading.dismiss();
                          setState(() {
                            Globals.subcategoriesLocal = value;
                          });
                        });
                      });
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
