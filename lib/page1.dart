// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_declarations, avoid_print, unnecessary_new, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutterproject/Data/projetOperations.dart';
import 'package:flutterproject/models/Projet.dart';
import 'package:flutterproject/widget/navigation_drawer.dart';

import './projets_list.dart';

class page1 extends StatelessWidget {
  const page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'project page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _projets = projets;
  late TextEditingController _nameController = TextEditingController();
  late TextEditingController _typeController = TextEditingController();
  late TextEditingController _descriptionController = TextEditingController();
  ProjetOperation projetOperation = ProjetOperation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
            future: projetOperation.getAllProjets(),
            builder: (context, AsyncSnapshot<List<Projet>> snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, int position) {
                        return Card(
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading:
                                  Icon(Icons.settings_input_composite_sharp),
                              title: Text(snapshot.data![position].name +
                                  " type of project " +
                                  snapshot.data![position].type),
                              subtitle:
                                  Text(snapshot.data![position].description!),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                  onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: Text('delete of project ' +
                                          snapshot.data![position].name),
                                      content: Text(
                                          "are you sure to delete this project " +
                                              snapshot.data![position].name),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            /* familleOperations.deleteFamilleID(
                                                snapshot.data![position].id!);
                                            await Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        FamillePage()));*/
                                            projetOperation.deleteProjectById(
                                                snapshot.data![position].id!);
                                            await Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        page1()));
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  child: const Text('DELETE'),
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  onPressed: () {
                                    _nameController.text =
                                        snapshot.data![position].name;
                                    _typeController.text =
                                        snapshot.data![position].type;
                                    _descriptionController.text =
                                        snapshot.data![position].description!;
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: Text('Update projet ' +
                                            snapshot.data![position].name),
                                        content: Column(children: <Widget>[
                                          Expanded(
                                            child: TextFormField(
                                              controller: _nameController,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Project name'),
                                            ),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              controller: _typeController,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Project Type'),
                                            ),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              controller:
                                                  _descriptionController,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText:
                                                      'Project description'),
                                            ),
                                          )
                                        ]),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancel'),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                              child: const Text('OK'),
                                              onPressed: () async {
                                                print(snapshot
                                                    .data![position].name);
                                                projetOperation
                                                    .updateProjetById(
                                                        snapshot.data![position]
                                                            .id!,
                                                        _nameController.text,
                                                        _typeController.text,
                                                        _descriptionController
                                                            .text);
                                                await Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                        builder: (context) =>
                                                            page1()));
                                              }),
                                        ],
                                      ),
                                    );
                                  },
                                  child: const Text('update'),
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ],
                        ));
                      })
                  : new Center(
                      child: Text('You have no project'),
                    );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _nameController.text = "";
            _typeController.text = "";
            _descriptionController.text = "";
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text('ADD PROJECT'),
                content: Column(children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Project name'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _typeController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Project Type'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Project description'),
                    ),
                  )
                ]),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                      child: const Text('ADD'),
                      onPressed: () async {
                        final projet = Projet(
                            name: _nameController.text,
                            type: _typeController.text,
                            description: _descriptionController.text);
                        projetOperation.createProjet(projet);
                        await Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => page1()));
                        print("pressed");
                      }),
                ],
              ),
            );
          },
          child: Icon(Icons.add),
        ));
  }
}
