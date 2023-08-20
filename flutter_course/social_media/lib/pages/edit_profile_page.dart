import 'package:flutter/material.dart';
import '../componenets/app_bar.dart';
import '../componenets/app_text_field.dart';
import '../config/app_strings.dart';
import '../config/user_avater.dart';
import '../styles/app_colors.dart';

enum Gender{
  none,
  male,
  female,
  other,
}
  class EditProfilePage extends StatefulWidget {

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var gender = Gender.none;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBarFile(
          title: AppStrings.editProfile,
          actions: [
            IconButton(
              onPressed: () {},
                icon: Icon(Icons.location_on),
            )
          ],
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: UserAvatar(size: 120,),
                  ),
                    Positioned(
                      bottom: 0, right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.all(Radius.circular(8))
                          ),
                            child: Icon(Icons.edit)),
                    ),
                  ],
                ),

                SizedBox(height: 40.0),

                AppTextField(hint: AppStrings.firstName),
                SizedBox(height: 16.0),
                AppTextField(hint: AppStrings.lastName),
                SizedBox(height: 16.0),
                AppTextField(hint: AppStrings.phoneNumber),
                SizedBox(height: 16.0),
                AppTextField(hint: AppStrings.location),
                SizedBox(height: 16.0),
                AppTextField(hint: AppStrings.birthDay),

                Container(
                  decoration: BoxDecoration(
                    color: AppColors.fieldColor,
                    borderRadius: BorderRadius.all(Radius.circular(16))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(AppStrings.gender),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(

                            child: RadioListTile(
                                title: Text(AppStrings.male),
                                value: Gender.male,
                                visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.maximumDensity),
                                contentPadding: EdgeInsets.zero,
                                groupValue: gender,
                                onChanged: (value){
                              setState(() {
                                gender = Gender.male;
                              });
                            }),
                          ),
                          Expanded(
                            child: RadioListTile(
                                title: Text(AppStrings.female),
                                value: Gender.female,
                                contentPadding: EdgeInsets.zero,
                                groupValue: gender,
                                onChanged: (value){
                              setState(() {
                                gender = Gender.female;
                              });
                            }),
                          ),
                          Expanded(
                            child: RadioListTile(
                                title: Text(AppStrings.other),
                                value: Gender.other,
                                contentPadding: EdgeInsets.zero,
                                groupValue: gender,
                                onChanged: (value){
                              setState(() {
                                gender = Gender.other;
                              });
                            }),
                          )


                        ],
                      ),
                    ],
                  ),
                )


              ],
            ),
          ),
        ),
      );
    }
}
