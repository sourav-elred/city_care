import 'dart:io';

import 'package:camera/camera.dart';
import 'package:city_care/screens/take_picture_screen.dart';
import 'package:city_care/view_models/report_incident_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class IncidentReportScreen extends StatefulWidget {
  const IncidentReportScreen({super.key});

  @override
  State<IncidentReportScreen> createState() => _IncidentReportScreenState();
}

class _IncidentReportScreenState extends State<IncidentReportScreen> {
  late ReportIncidentViewModel _reportIncidentViewModel;

  @override
  void initState() {
    super.initState();
    _reportIncidentViewModel = context.read<ReportIncidentViewModel>();
  }

  void _showCamera(BuildContext context) async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    final path = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TakePictureScreen(camera: camera),
      ),
    );

    setState(() {
      _reportIncidentViewModel.imagePath = path;
    });
  }

  void _showGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _reportIncidentViewModel.imagePath = image!.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Report an incident")),
      body: Consumer<ReportIncidentViewModel>(
        builder: (context, vm, child) => SingleChildScrollView(
          child: Column(
            children: <Widget>[
              if (vm.imagePath.isNotEmpty) Image.file(File(vm.imagePath)),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                            height: 150,
                            child: Column(children: <Widget>[
                              ListTile(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    _showCamera(context);
                                  },
                                  leading: const Icon(Icons.photo_camera),
                                  title: const Text("Take a picture")),
                              ListTile(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    _showGallery();
                                  },
                                  leading: const Icon(Icons.photo_album),
                                  title:
                                      const Text("Select from photo library"))
                            ]));
                      });
                },
                child: const Text(
                  "Take Picture",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextField(
                onChanged: (value) => vm.title = value,
                decoration: InputDecoration(
                  labelText: "Enter title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              TextField(
                onChanged: (value) => vm.description = value,
                textInputAction: TextInputAction.done,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration:
                    const InputDecoration(labelText: "Enter desciption"),
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  vm.saveIncident();
                  Navigator.pop(context);
                },
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
