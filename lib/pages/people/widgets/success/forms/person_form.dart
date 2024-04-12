import 'package:church_dashboard/config/responsive.dart';
import 'package:church_dashboard/data_source/models/person_model.dart';
import 'package:church_dashboard/global_values.dart';
import 'package:church_dashboard/pages/people/bloc/forms/people/person_add_form_bloc.dart';
import 'package:church_dashboard/pages/people/bloc/people_bloc/people_bloc.dart';
import 'package:church_dashboard/theme/light.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PersonForm extends StatelessWidget {
  final int? personId;
  final BuildContext? parentContext;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController otherNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController joinedOnController = TextEditingController();

  PersonForm({super.key, this.personId, this.parentContext});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PeopleBloc, PeopleState>(
      listener: (context, state) {
        if (state.status == PeopleStatus.success) {
          if (parentContext != null) {
            BlocProvider.of<PeopleBloc>(parentContext!).add(GetPeople());
          }
          Navigator.of(context).pop();
        }
      },
      child: BlocBuilder<PersonFormBloc, PersonFormState>(
        builder: (context, state) {
          if (personId != null) {
            if (state.status == PersonFormStatus.initial) {
              context.read<PersonFormBloc>().add(GetFormPerson(personId!));
            } else if (state.status == PersonFormStatus.success) {
              var person = context.read<PersonFormBloc>().state.person!;
              return _buildBody(context, oldPerson: person);
            } else if (state.status == PersonFormStatus.loading) {
              return _buildLoadingBody(context);
            } else if (state.status == PersonFormStatus.error) {
              return _buildErrorBody(context);
            }
          }
          return _buildBody(context, oldPerson: null);
        },
      ),
    );
  }

  Widget _buildLoadingBody(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: (Responsive.isDesktop(context)) ? 30.w : 40.w,
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              // const DialogTitleWidget(text: 'Person Form'),
              Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        border:
                            Border.all(width: 1, color: LightAppColor.darker),
                      ),
                      child: const CupertinoActivityIndicator(),
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        border:
                            Border.all(width: 1, color: LightAppColor.darker),
                      ),
                      child: const CupertinoActivityIndicator(),
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        border:
                            Border.all(width: 1, color: LightAppColor.darker),
                      ),
                      child: const CupertinoActivityIndicator(),
                    ),
                    SizedBox(height: 3.h),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        border:
                            Border.all(width: 1, color: LightAppColor.darker),
                      ),
                      child: const CupertinoActivityIndicator(),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildErrorBody(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: (Responsive.isDesktop(context)) ? 30.w : 40.w,
        child: Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            border: Border.all(width: 1, color: LightAppColor.darker),
          ),
          child: const Text("An error occurred"),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, {PersonModel? oldPerson}) {
    return SizedBox(
      width: 400,
      height: 500,
      child: Column(
        children: [
          const Text(
            'Add Member',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'First Name'),
            controller: firstNameController,
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Last Name'),
            controller: lastNameController,
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Other Name'),
            controller: otherNameController,
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Email'),
            controller: emailController,
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Phone'),
            controller: phoneController,
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Address'),
            controller: addressController,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                onPressed: () {
                  var person = PersonModel(
                      firstName: firstNameController.text.trim(),
                      otherName: otherNameController.text.trim(),
                      lastName: lastNameController.text.trim(),
                      email: emailController.text.trim(),
                      phone: phoneController.text.trim(),
                      address: addressController.text.trim(),
                      dateJoined: DateTime.now());
                  context.read<PersonFormBloc>().add(PostPerson(person));
                },
                child: const Text('Add'),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
