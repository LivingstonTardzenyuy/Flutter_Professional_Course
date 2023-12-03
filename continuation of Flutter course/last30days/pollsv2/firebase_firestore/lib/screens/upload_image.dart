import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {

  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  bool isLoading = false;
  Future<void> uploadImage() async {
    final picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: ImageSource == 'camera' ? ImageSource.camera : ImageSource.gallery);

    if(pickedImage == null){
      return null;
    }
    String fileName = pickedImage.name;
    // File imageFile = File(pickedImage.path);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload to firebase storage"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.camera), label: Text("Camera"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue
                ),
                ),

                ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.library_add), label: Text("Gallery"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent
                ),
                ),


              ],
            )
          ],
        ),
      ),
    );
  }
}
