//!SizeConfig shortcuts

//Get dimensions from [SizeConfig]

import './size_config.dart';

double get rWidthMultiplier => SizeConfig.widthMultiplier;
double get rHeightMultiplier => SizeConfig.heightMultiplier;

double rw(double width) => SizeConfig.setWidth(width);
double rh(double height) => SizeConfig.setHeight(height);
double rf(double size) => SizeConfig.setSp(size);
