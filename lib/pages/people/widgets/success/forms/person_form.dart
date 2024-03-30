import 'package:church_dashboard/config/responsive.dart';
import 'package:church_dashboard/data_source/models/person_model.dart';
import 'package:church_dashboard/global_values.dart';
import 'package:church_dashboard/pages/people/bloc/forms/people/person_add_form_bloc.dart';
import 'package:church_dashboard/pages/people/bloc/people_bloc/people_bloc.dart';
import 'package:church_dashboard/theme/light.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PersonForm extends StatelessWidget {
  final int? personId;
  final BuildContext? parentContext;

  const PersonForm({super.key, this.personId, this.parentContext});

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
          return const Placeholder();
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
    return const Placeholder();
  }

// Widget _buildCompanyBody(BuildContext context, BoxConstraints constraints,
//     {PersonModel? oldPerson}) {
//   return Column(
//     children: [
//       SizedBox(height: 2.h),
//       BlocBuilder<IndustryTypeBloc, IndustryTypeState>(
//         builder: (context, state) {
//           if (state.status == IndustryTypeStatus.initial) {
//             context.read<IndustryTypeBloc>().add(GetIndustryTypes());
//             return Container(
//               height: 55,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(8.0),
//                 ),
//                 border: Border.all(width: 1, color: LightAppColor.darker),
//               ),
//               child: const CupertinoActivityIndicator(),
//             );
//           }
//           if (state.status == IndustryTypeStatus.success) {
//             return SizedBox(
//               height: 50,
//               child: DropdownButtonFormField2(
//                 value: oldPerson?.businessIndustryId,
//                 decoration: const InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(8.0),
//                       ),
//                     ),
//                     label: Text("Industry")),
//                 items: context
//                     .read<IndustryTypeBloc>()
//                     .state
//                     .types
//                     ?.map((industryType) => DropdownMenuItem(
//                           value: industryType.id,
//                           child: Text(industryType.name!),
//                         ))
//                     .toList(),
//                 onChanged: (value) => person.businessIndustryId = value,
//               ),
//             );
//           }
//           if (state.status == IndustryTypeStatus.error) {
//             return Container(
//               height: 55,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(8.0),
//                 ),
//                 border: Border.all(width: 1, color: LightAppColor.darker),
//               ),
//               child: const Center(
//                 child: Icon(Icons.error_outline_rounded),
//               ),
//             );
//           }
//           return Container(
//             height: 55,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(8.0),
//               ),
//               border: Border.all(width: 1, color: LightAppColor.darker),
//             ),
//             child: const CupertinoActivityIndicator(),
//           );
//         },
//       ),
//       SizedBox(height: 2.h),
//     ],
//   );
// }
}
