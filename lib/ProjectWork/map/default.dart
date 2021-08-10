
import 'dart:async';
import 'farm_entity.dart';



List<FarmEntity> defaultfelist = [
  FarmEntity(
      id: 0,
      type: 0,
      lat: 1.37,
      long: 103.7,
      name: "javier potato farm",
      imagePath:
      "https://static.straitstimes.com.sg/s3fs-public/articles/2017/06/03/st_20170603_lifwoha_3182792_0.jpg"),
  FarmEntity(
      id: 1,
      type: 1,
      lat: 1.41,
      long: 103.9,
      name: "xavier and friends",
      imagePath:
      "https://s.wsj.net/public/resources/images/BN-QU205_gerpre_IM_20161114034645.jpg"),
  FarmEntity(
      id: 2,
      type: 2,
      lat: 1.42,
      long: 103.83,
      name: "TEST3 free real estate",
      imagePath:
      "https://miro.medium.com/max/1000/1*d8DyNLUIa8xo5rGrO-2FSg.jpeg"),
];

List<FarmEntity> failfelist = [
  FarmEntity(
    id: 0,
    type: 0,
    lat: 1.35,
    long: 103.8,
    name: "Connection to database unsuccessful!",
  ),
];
