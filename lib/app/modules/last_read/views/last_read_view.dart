import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/last_read_controller.dart';

class LastReadView extends GetView<LastReadController> {
  const LastReadView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LastReadView'),
          centerTitle: true,
        ),
        body: DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            disabledItemFn: (String s) => s.startsWith('I'),
          ),
          items: const ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
          onChanged: print,
          selectedItem: "Brazil",
        ));
  }
}
