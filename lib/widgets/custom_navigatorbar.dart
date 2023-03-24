import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_qr_maps/providers/providers.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    //Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int index) => uiProvider.selectedMenuOpt = index,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
              //color: Theme.of(context).primaryColor,
            ),
            label: 'Maps'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.compass_calibration,
              //color: Theme.of(context).primaryColor,
            ),
            label: 'Direcciones')
      ],
    );
  }
}
