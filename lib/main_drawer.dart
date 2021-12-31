import'package:flutter/material.dart';
import'projet2.dart';
import'page1.dart';
import'projet3.dart';
class MainDrawer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child:Column(
          children:<Widget>[
            Container(
                width:double.infinity,
                padding:EdgeInsets.all(20),
                color:Theme.of(context).primaryColor,
                child:Center(
                    child:Column(
                      children: <Widget>[
                        Container(
                            width:100,
                            height:100,
                            margin:EdgeInsets.only(
                              top:30,
                              bottom: 10,
                            ),
                            decoration:BoxDecoration(
                              shape:BoxShape.circle,
                              image:DecorationImage(
                                  image:NetworkImage(
                                      'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.blogdumoderateur.com%2Fgestion-de-projet-erreurs-a-ne-pas-commettre%2F&psig=AOvVaw1TB8Tl2x5qsFdUhkj2aAty&ust=1640953038597000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJCTrcrAi_UCFQAAAAAdAAAAABAD'
                                  ),
                                  fit:BoxFit.fill),

                            )

                        ),
                        Text(
                          'Projet1',
                          style: TextStyle(
                            fontSize:22,
                            color:Colors.white,
                          ),
                        ),
                        Text(
                          'Gestion des restaurants',
                          style: TextStyle(
                            fontSize:22,
                            color:Colors.white,
                          ),
                        ),
                      ],
                    )
                )
            ),
            ListTile(
              leading: Icon(Icons.person),
              title:Text(
                'profile',
                style:TextStyle(
                  fontSize:18,
                ),
              ),
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => projet2(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title:Text(
                'Projet',
                style:TextStyle(
                  fontSize:18,
                ),
              ),
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => page1(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.auto_stories),
              title:Text(
                'Livres',
                style:TextStyle(
                  fontSize:18,
                ),
              ),
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => projet2(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance),
              title:Text(
                'Societé',
                style:TextStyle(
                  fontSize:18,
                ),
              ),
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => projet3(),
                  ),
                );
              },
            ),
          ],
        )

    );
  }}