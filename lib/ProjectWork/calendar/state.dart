import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentstep = StateProvider((ref) => 1);
final selectedplace = StateProvider((ref)=>'');
final selecteddate = StateProvider((ref)=> DateTime.now());
final selecttimeslot = StateProvider((ref)=>-1);
final selectedtime = StateProvider((ref)=>'');
final selecttype = StateProvider((ref)=>'');
final selectremind = StateProvider((ref)=>'');