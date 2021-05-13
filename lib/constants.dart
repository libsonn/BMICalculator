import 'package:flutter/material.dart';

const Color deepAquaColor = Color(0xFF003B46);
const Color oceanColor = Color(0xFF07575B);
const Color waveColor = Color(0xFF66A5AD);
const Color seafoamColor = Color(0xFFC4DFE6);

enum Units { Metrical, Imperial, OldPolish }

Map<Units, String> boundHeightValues = {
  Units.Metrical: '100 cm - 220 cm',
  Units.Imperial: '3 feet - 7 feet',
  Units.OldPolish: '1.7 Ł - 3.7 Ł'
};
Map<Units, String> boundWeightValues = {
  Units.Metrical: '20 kg - 300 kg',
  Units.Imperial: '44 lb - 661 lb',
  Units.OldPolish: '50 F - 740 F'
};
