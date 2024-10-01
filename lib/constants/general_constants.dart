import 'package:flutter/material.dart';

bool isRTL = false;
const bool viewLog = true;
void setIsRTL(BuildContext context) => isRTL = Directionality.of(context)
    .toString()
    .contains(TextDirection.rtl.name.toLowerCase());
