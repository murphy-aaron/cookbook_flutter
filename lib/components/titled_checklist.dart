import 'package:flutter/material.dart';
import '../util/constants.dart';

class TitledChecklist extends StatefulWidget {
  const TitledChecklist({super.key, required this.title, required this.listItems});

  final String title;
  final List<String> listItems;

  @override
  State<TitledChecklist> createState() => _TitledChecklistState();
}

class _TitledChecklistState extends State<TitledChecklist> {

  late List<bool> listItemsChecked;

  @override
  void initState() {
    listItemsChecked = List.filled(widget.listItems.length, false, growable: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final String title = widget.title;
    final List<String> listItems = widget.listItems;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            final String label = listItems[index];
            return ChecklistItem(
                label: label,
                isChecked: listItemsChecked[index],
                checkboxCallback: (checkboxState) {
                  setState(() {
                    listItemsChecked[index] = checkboxState!;
                  });
                }
            );
          },
          itemCount: listItems.length,
          shrinkWrap: true,
          primary: false,
        ),
      ],
    );
  }
}

class ChecklistItem extends StatelessWidget {

  const ChecklistItem({super.key, required this.label, required this.isChecked, required this.checkboxCallback});

  final String label;
  final bool isChecked;
  final Function(bool?) checkboxCallback;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            splashRadius: 0,
            activeColor: kPrimaryColor,
            value: isChecked,
            onChanged: checkboxCallback,
          ),
          Text(label)
        ]
    );
  }
}
