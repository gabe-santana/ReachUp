import 'package:ReachUp/Component/Dialog/CustomDialog.component.dart';
import 'package:ReachUp/Controller/ClientPreference.controller.dart';
import 'package:ReachUp/Repositories/SubCategory.repository.dart';
import 'package:ReachUp/globals.dart';
import 'package:ReachUp/main.dart';
import 'package:async/async.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'CategoryPreference.view.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ClientPreferenceController clientPreferenceController =
      new ClientPreferenceController();

  buildlistView() {
    _memoizer.runOnce(() {
      EasyLoading.show(status: "Carregando...");
      clientPreferenceController.byUser(Globals.user.email).then((value) {
        EasyLoading.dismiss();
        setState(() {
          Globals.userPreference.subCategories = value;
        });
      });
    });
  }

  AsyncMemoizer _memoizer;
  @override
  initState() {
    super.initState();
    _memoizer = AsyncMemoizer();
    Globals.subCategoriesPreferenceChecked.clear();
  }

  @override
  void deactivate() {
    EasyLoading.dismiss();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.userAlt,
                          color: Theme.of(context).colorScheme.onBackground,
                          size: 45,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Globals.user.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onBackground,
                                fontSize: 18),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              Globals.user.email,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.edit, color: Colors.grey)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                        child: Text(
                          "Minhas preferências",
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.onBackground),
                        ),
                      ),
                      Container(
                        height: 300,
                        child: Builder(builder: (context) {
                          buildlistView();
                          return Stack(
                            children: [
                              ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount:
                                      Globals.userPreference.subCategories.length,
                                  itemBuilder: (context, index) => ListTile(
                                        trailing: IconButton(
                                          tooltip:
                                              "Deletar ${Globals.userPreference.subCategories[index].category.categoryName} ${Globals.userPreference.subCategories[index].subCategoryName}",
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context) =>
                                                    CustomDialog(
                                                      icon: Icons.delete,
                                                      title: "Deletar",
                                                      description:
                                                          "Deletar ${Globals.userPreference.subCategories[index].subCategoryName} em ${Globals.userPreference.subCategories[index].category.categoryName} ?",
                                                      buttonOK: RaisedButton(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .error,
                                                        onPressed: () {
                                                          EasyLoading.show(
                                                              status:
                                                                  "Deletando...");
                                                          clientPreferenceController
                                                              .delete(
                                                                  Globals
                                                                      .user.email,
                                                                  Globals
                                                                      .userPreference
                                                                      .subCategories[
                                                                          index]
                                                                      .category
                                                                      .categoryId,
                                                                  Globals
                                                                      .userPreference
                                                                      .subCategories[
                                                                          index]
                                                                      .subCategoryId)
                                                              .then((value) {
                                                            EasyLoading.dismiss();
                                                            setState(() {
                                                              Globals
                                                                  .userPreference
                                                                  .subCategories
                                                                  .removeAt(
                                                                      index);
                                                            });
                                                            Navigator.pop(
                                                                context);
                                                          });
                                                        },
                                                        child: Text(
                                                          "Deletar",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
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
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .onBackground),
                                                        ),
                                                      ),
                                                    ));
                                          },
                                          icon: Icon(Icons.delete,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .error),
                                        ),
                                        title: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  0, 0, 20, 0),
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.fill,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  httpHeaders: {
                                                    "Authorization":
                                                        "Bearer ${Globals.user.token}"
                                                  },
                                                  imageUrl:
                                                      SubCategoryRepository()
                                                          .getImage(
                                                              Globals
                                                                  .userPreference
                                                                  .subCategories[
                                                                      index]
                                                                  .category
                                                                  .categoryId,
                                                              Globals
                                                                  .userPreference
                                                                  .subCategories[
                                                                      index]
                                                                  .subCategoryId),
                                                  placeholder: (context, url) =>
                                                      Center(
                                                    child: CircularProgressIndicator(
                                                        valueColor:
                                                            new AlwaysStoppedAnimation<
                                                                    Color>(
                                                                Colors.grey)),
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${Globals.userPreference.subCategories[index].category.categoryName}",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onBackground,
                                                      fontSize: 16),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,
                                                  child: Text(
                                                    "${Globals.userPreference.subCategories[index].subCategoryName}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                      )),
                            ],
                          );
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
                                      CategoryPreferenceView(),
                                      "Preferências",
                                      "Aqui você poderá adicionar novas preferências!",
                                      context,
                                      true)
                                  .then((value) {
                                setState(() {
                                  EasyLoading.show(status: "Carregando...");
                                  clientPreferenceController
                                      .byUser(Globals.user.email)
                                      .then((value) {
                                    EasyLoading.dismiss();

                                    Globals.userPreference.subCategories = value;
                                  });
                                });
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
