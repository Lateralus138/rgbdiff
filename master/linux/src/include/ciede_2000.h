#ifndef CIEDE_2000_H
#define CIEDE_2000_H
struct LABColorData
{
  double lightness;
  double axisA;
  double axixB;
};
struct XYZColorData
{
  double x;
  double y;
  double z;
};
struct RGBColorData
{
  double red;
  double green;
  double blue;
};
double ciede_2000(const long long& color_1, const long long& color_2);
#endif // !CIEDE_2000_H
