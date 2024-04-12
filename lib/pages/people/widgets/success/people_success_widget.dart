import 'dart:async';

import 'package:church_dashboard/data_source/models/person_model.dart';
import 'package:church_dashboard/global_values.dart';
import 'package:church_dashboard/pages/people/bloc/forms/people/person_add_form_bloc.dart';
import 'package:church_dashboard/pages/people/bloc/people_bloc/people_bloc.dart';
import 'package:church_dashboard/pages/people/widgets/success/forms/person_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_web_data_table/web_data_table.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PeopleSuccessWidget extends StatefulWidget {
  const PeopleSuccessWidget({super.key});

  @override
  State<PeopleSuccessWidget> createState() => _PeopleSuccessWidgetState();
}

class _PeopleSuccessWidgetState extends State<PeopleSuccessWidget> {
  late String _sortColumnName;
  late bool _sortAscending;
  List<String>? _filterTexts;
  bool _willSearch = true;
  Timer? _timer;
  int? _latestTick;
  final List<String> _selectedRowKeys = [];
  int _rowsPerPage = 20;

  /// DataGridSource required for SfDataGrid to obtain the row data.

  Widget _buildLayoutBuilder() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint) => SizedBox(
        width: constraint.maxWidth,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Builder(builder: (context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.16,
          child: WebDataTable(
            header: const Text('People'),
            actions: _buildActions,
            columnSpacing: 0,
            source: WebDataTableSource(
              sortColumnName: _sortColumnName,
              sortAscending: _sortAscending,
              filterTexts: _filterTexts,
              columns: [
                WebDataColumn(
                  name: 'name',
                  label: const Text('Name'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
                WebDataColumn(
                  name: 'phone',
                  label: const Text('Telephone'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
                WebDataColumn(
                  name: 'email',
                  label: const Text('Email'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
                WebDataColumn(
                  name: 'address',
                  label: const Text('Address'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
                WebDataColumn(
                  name: 'dateJoined',
                  label: const Text('Joined On'),
                  dataCell: (value) => DataCell(Text(DateFormat(
                          'dd/MM/yyyy, hh:mm a')
                      .format(DateFormat('dd-MM-yyyy, hh:mm a').parse(
                          DateFormat('dd-MM-yyyy, hh:mm a').format(value))))),
                ),
                WebDataColumn(
                  name: 'active',
                  label: const Text('Active'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
                WebDataColumn(
                  name: 'createdAt',
                  label: const Text('Date Created'),
                  dataCell: (value) => DataCell(Text(DateFormat(
                          'dd/MM/yyyy, hh:mm a')
                      .format(DateFormat('dd-MM-yyyy, hh:mm a').parse(
                          DateFormat('dd-MM-yyyy, hh:mm a').format(value))))),
                ),
              ],
              // Call to bloc to provide state from which we get the variables/data of the current state.
              rows: context
                  .read<PeopleBloc>()
                  .state
                  .people!
                  .map((e) => e.toViewJson())
                  .toList(),
              selectedRowKeys: _selectedRowKeys,
              onTapRow: (rows, index) {
                var person = PersonModel.fromJson(rows[index]);
                Navigator.pushNamed(context, "/person", arguments: person.id);
              },
              onSelectRows: null,
              primaryKeyName: 'number',
            ),
            horizontalMargin: 10,
            onPageChanged: (offset) {},
            onSort: (columnName, ascending) {
              setState(() {
                _sortColumnName = columnName;
                _sortAscending = ascending;
              });
            },
            onRowsPerPageChanged: (rowsPerPage) {
              setState(() {
                if (rowsPerPage != null) {
                  _rowsPerPage = rowsPerPage;
                }
              });
            },
            rowsPerPage: _rowsPerPage,
          ),
        );
      }),
    );
  }

  List<Widget> get _buildActions {
    return [
      SizedBox(
        width: 30.w,
        height: 50,
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: "Search people",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (text) {
            _filterTexts = text.trim().split(' ');
            _willSearch = false;
            _latestTick = _timer?.tick;
          },
        ),
      ),
      SizedBox(width: 1.w),
      if (_selectedRowKeys.isNotEmpty)
        _buildButton(
          "Delete",
          () {
            setState(() {
              _selectedRowKeys.clear();
            });
          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.red)),
        ),
      _buildButton("Refresh", () {
        context.read<PeopleBloc>().add(GetPeople());
      }),
      _buildButton("Add", () async {
        _buildAddForm();
      }),
    ];
  }

  Widget _buildButton(String title, Function()? onPressed,
      {ButtonStyle? style}) {
    return FilledButton(
      onPressed: onPressed,
      style: style,
      child: Text(
        title,
      ),
    );
  }

  _buildAddForm() async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext childContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularRadius),
          ),
          child: MultiBlocProvider(providers: [
            BlocProvider<PeopleBloc>(
              create: (_) => PeopleBloc(),
            ),
            BlocProvider<PersonFormBloc>(
              create: (_) => PersonFormBloc(),
            ),
          ], child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PersonForm(parentContext: context),
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildLayoutBuilder();
  }

  @override
  void initState() {
    super.initState();

    _sortColumnName = "*";
    _sortAscending = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_willSearch) {
        if (_latestTick != null && timer.tick > _latestTick!) {
          _willSearch = true;
        }
      }
      if (_willSearch) {
        _willSearch = false;
        _latestTick = null;
        setState(() {
          if (_filterTexts != null && _filterTexts!.isNotEmpty) {
            _filterTexts = _filterTexts;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }
}
