import 'package:ReachUp/Controller/LocalController.dart';
import 'package:ReachUp/Model/Local.dart';
import 'package:ReachUp/View/HomeView/Home.view.dart';
import 'package:ReachUp/View/SearchView/SearchCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

String search;
var _controller = TextEditingController();
List<Local> locates;
final _formKey = GlobalKey<FormState>();
final _LocalController = new LocalController();



buildListView(){
  return ListView.builder(
      itemCount: locates.length,
      itemBuilder: (context, index){
        return SearchCard(local: locates[index]);
      }
  );
}
class _SearchState extends State<Search> {
  bool loading= false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
          actions: [
                 Expanded(
                    child: Container(
                       color: Theme.of(context).primaryColor,
                        child: Form(
                          key: _formKey,
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: 
                                  IconButton(
                                    icon: Icon(Icons.arrow_back, 
                                      size: 35,
                                      color: Colors.white,
                                    ),
                                   onPressed: (){
                                     Navigator.pop(context);
                                   },
                                  )
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(15, 10, 20, 10),
                                  child: 
                                  TextFormField(
                                    validator: (value){
                                      if (value.isEmpty){
                                        return "Campo vazio";
                                      }
                                      return null;
                                    },
                                    onChanged: (val){
                                      debugPrint(val);
                                  
                                        if(val.isNotEmpty)
                                        {
                                           setState(() {
                                             loading = true;
                                           });
                                        
                                              _LocalController.search(val).then((value) => {
                                                setState((){
                                                    locates = value;
                                                })
                                              
                                              });
                                         
    
                                            setState(() {
                                             loading = false;
                                           });
                                        }
                                        else{
                                          setState(() {
                                            locates.clear();
                                          });
                                        }
                           
                                    },
                                    controller: _controller,
                                    cursorColor: Colors.white,
                                    style: TextStyle(
                                      decorationColor: Colors.white,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                       focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 2.0,
                                          ),
                                        ),
                                       suffixIcon: IconButton(
                                          onPressed: () {
                                             setState((){
                                                locates.clear();
                                             });
                                            _controller.clear();
                                          },
                                          icon: Icon(Icons.clear, size: 30, color: Colors.white),
                                        ),
                                        hintText: "lojas, locais, produtos ...",
                                        hintStyle: TextStyle(
                                          color: Color(0xFFd9d9d9),
                                          fontSize: 21,
                                        ),
                                        labelText: "Pesquisar",
                                        labelStyle: TextStyle(
                                            color: Colors.white,
                                            decorationColor: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20)),
                                  ),
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                icon: Icon(Icons.filter_list,
                                    size: 35,
                                    color: Colors.white,),
                                onPressed: () {
                                  print("Filter");
                                },
                              ),
                                IconButton(
                                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                icon: Icon(Icons.mic,
                                    size: 35,
                                    color: Colors.white,),
                                onPressed: () {
                                  print("Mic");
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
          ],
          bottom: TabBar(
           isScrollable: true,
            labelStyle: TextStyle(
              fontSize: 20,
            ),
            tabs: [
              Tab(text: "Todos",),
              Tab(text: "Lojas"),
              Tab(text: "Restaurantes"),
              Tab(text: "Livrarias"),
              Tab(text: "Cinema")
            ],
          ),
        ),
          body: SafeArea(
            child: Container(
                child: Column(
                  children: <Widget>[
                    
                   Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 25, 10,25),
                      child: loading == true ? 
                      Center(
                            child: CircularProgressIndicator(
                            strokeWidth: 7.0,
                         ),
                      )
                       : locates !=null ? buildListView() : Center(
                        child: 
                        Text("Sem resultados"),
                      )
                      ,
                      )
                    ),
                  ],
                )),
      )),
    );
  }
}
