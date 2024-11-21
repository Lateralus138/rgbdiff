#include "stdafx.h"
#include "ArgumentParser.h"
ArgumentParser::ArgumentParser(int& argc, const char** argv, int start)
{
  this->tokens = std::vector<std::string>(argv + start, argv + argc);
}
const std::vector<std::string> &ArgumentParser::getArgs() const
{
  return this->tokens;
}
bool ArgumentParser::optionExists(const std::string& option) const
{
  return (std::find(this->tokens.begin(), this->tokens.end(), option) != this->tokens.end());
}
bool ArgumentParser::optionsExist(const std::vector<std::string>& options) const
{
  for (std::vector<std::string>::const_iterator iter = options.begin(); iter < options.end(); iter++)
  {
    if (this->optionExists(*iter)) return true;
  }
  return false;
}
const std::string& ArgumentParser::getOption(const std::string& option) const
{
  std::vector<std::string>::const_iterator iterator;
  iterator = std::find(this->tokens.begin(), this->tokens.end(), option);
  if ((iterator != this->tokens.end()) && ((iterator + 1) != this->tokens.end()))
  {
    std::advance(iterator, 1);
    return *iterator;
  }
  static const std::string empty("");
  return empty;
}
// TODO Revaluate how getOptions work and what and why it returns what it does.
const std::string& ArgumentParser::getOptions(const std::vector<std::string>& options) const
{
  for (std::vector<std::string>::const_iterator iter = options.begin(); iter < options.end(); iter++)
  {
    const std::string &arg = this->getOption(*iter);
    if (!arg.empty()) return arg;
  }
  static const std::string empty("");
  return empty;
}