#include "ciede_2000.h"
#include <cmath>
#include "stdafx.h"
static void InverseSRGBCompanding(double& eightBitColor)
{
  eightBitColor =
    (eightBitColor > 0.04045) ?
    std::pow(((eightBitColor + 0.055) / 1.055), 2.4) :
    (eightBitColor / 12.92);
}
static void InverseXYZCompanding(double& coordColor)
{
  coordColor =
    (coordColor > 0.008856) ?
    std::pow(coordColor, 1 / 3.0) :
    ((7.787 * coordColor) + (16.0 / 116.0));
}
static void CalibrateXYZ(XYZColorData& xyz, const double& red, const double& green, const double& blue)
{
  xyz.x = red * 0.4124 + green * 0.3576 + blue * 0.1805;
  xyz.y = red * 0.2126 + green * 0.7152 + blue * 0.0722;
  xyz.z = red * 0.0193 + green * 0.1192 + blue * 0.9505;
}
static void CalibrateLAB(LABColorData& lab, const double& x, const double& y, const double& z)
{
  lab.lightness = (116 * y - 16);
  lab.axisA = (500 * (x - y));
  lab.axixB = (200 * (y - z));
}
static void ConvertRGBToXYZ(const RGBColorData& rgb, XYZColorData& xyz)
{
  double red = rgb.red / 255.0;
  double green = rgb.green / 255.0;
  double blue = rgb.blue / 255.0;
  InverseSRGBCompanding(red);
  InverseSRGBCompanding(green);
  InverseSRGBCompanding(blue);
  red *= 100;
  green *= 100;
  blue *= 100;
  CalibrateXYZ(xyz, red, green, blue);
}
static void ConvertXYZToLAB(const XYZColorData& xyz, LABColorData& lab)
{
  const double xReference = 95.047;
  const double yReference = 100.0;
  const double zReference = 108.883;
  double x = xyz.x / xReference;
  double y = xyz.y / yReference;
  double z = xyz.z / zReference;
  InverseXYZCompanding(x);
  InverseXYZCompanding(y);
  InverseXYZCompanding(z);
  CalibrateLAB(lab, x, y, z);
}
static void ConvertHEXToRGB(const long long& hex, RGBColorData& rgb)
{
  rgb.red = static_cast<double>((hex >> 0x00000010) & 0xff);
  rgb.green = static_cast<double>((hex >> 0x00000008) & 0xff);
  rgb.blue = static_cast<double>(hex & 0xff);
}
double ciede_2000(const long long& color_1, const long long& color_2)
{
  RGBColorData rgb_1  { 0.0, 0.0, 0.0 };
  RGBColorData rgb_2  { 0.0, 0.0, 0.0 };
  XYZColorData xyz_1  { 0.0, 0.0, 0.0 };
  XYZColorData xyz_2  { 0.0, 0.0, 0.0 };
  LABColorData lab_1  { 0.0, 0.0, 0.0 };
  LABColorData lab_2  { 0.0, 0.0, 0.0 };
  ConvertHEXToRGB(color_1, rgb_1);
  ConvertHEXToRGB(color_2, rgb_2);
  ConvertRGBToXYZ(rgb_1, xyz_1);
  ConvertRGBToXYZ(rgb_2, xyz_2);
  ConvertXYZToLAB(xyz_1, lab_1);
  ConvertXYZToLAB(xyz_2, lab_2);
  return 
    std::sqrt
    (
      std::pow(std::abs(lab_1.lightness - lab_2.lightness), 2) +
      std::pow(std::abs(lab_1.axisA - lab_2.axisA), 2) +
      std::pow(std::abs(lab_1.axixB - lab_2.axixB), 2)
    );
}