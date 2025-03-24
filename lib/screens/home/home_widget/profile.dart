import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'settings/settings.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  File? _selectedImage;

  // بيانات المستخدم (بدلًا من Provider)
  String _name = "اسم المستخدم";
  String _email = "user@example.com";
  String _phone = "1234567890";
  String _profilePhoto = "";

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: _name);
    _emailController = TextEditingController(text: _email);
    _phoneController = TextEditingController(text: _phone);
    _selectedImage = _profilePhoto.isNotEmpty ? File(_profilePhoto) : null;
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _saveChanges() {
    setState(() {
      _name = _nameController.text;
      _email = _emailController.text;
      _phone = _phoneController.text;
      _profilePhoto = _selectedImage?.path ?? '';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم حفظ التغييرات بنجاح')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الملف الشخصي'),
        backgroundColor: Colors.green.shade800, // لون أخضر داكن
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // قسم الصورة والمعلومات
            _buildProfileImageSection(),
            const SizedBox(height: 20),
            _buildEditableProfileSection(),
            const SizedBox(height: 30),
            // قسم الإعدادات
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImageSection() {
    return GestureDetector(
      onTap: _pickImage,
      child: CircleAvatar(
        radius: 60,
        backgroundColor: Colors.green.shade100, // لون خلفية الصورة
        backgroundImage: _selectedImage != null
            ? FileImage(_selectedImage!)
            : _profilePhoto.isNotEmpty
                ? FileImage(File(_profilePhoto))
                : null,
        child: _selectedImage == null && _profilePhoto.isEmpty
            ? Icon(Icons.camera_alt, size: 40, color: Colors.green.shade800)
            : null,
      ),
    );
  }

  Widget _buildEditableProfileSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'الاسم الكامل',
                labelStyle: TextStyle(color: Colors.green.shade800),
                prefixIcon: Icon(Icons.person, color: Colors.green.shade800),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green.shade800),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'البريد الإلكتروني',
                labelStyle: TextStyle(color: Colors.green.shade800),
                prefixIcon: Icon(Icons.email, color: Colors.green.shade800),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green.shade800),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'رقم الهاتف',
                labelStyle: TextStyle(color: Colors.green.shade800),
                prefixIcon: Icon(Icons.phone, color: Colors.green.shade800),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green.shade800),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveChanges,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade800, // لون أخضر داكن
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'حفظ التغييرات',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.green.shade800),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.green.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.green.shade800),
        onTap: onTap,
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
