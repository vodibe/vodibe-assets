#define LAYOUT_ITALIAN
// #define LAYOUT_US_INTERNATIONAL
#include "DigiKeyboard.h"

void setup()
{
  DigiKeyboard.delay(1000);

  DigiKeyboard.println("keyboard-payload");
}

void loop()
{
  // this is generally not necessary but with some older systems it seems to
  // prevent missing the first character after a delay:
  // DigiKeyboard.sendKeyStroke(0);
}
