# SPDX-License-Identifier: Unlicense
# Data for the named linear fixture C gate. Product wire only.
# Occupancy 49. FullHost false. Do not mill. Do not regenerate.
{
  fixtureNames = [
    "slake_linearFixtureMintId"
    "slake_linearFixtureLiveView"
    "slake_linearFixtureSpentView"
    "slake_linearFixtureProgramReady_true"
  ];
  defineRels = [
    "src/systems/emit/slake_freestanding.c"
    "out/freestanding-c/slake_freestanding.c"
  ];
  declareRels = [
    "src/systems/emit/slake_freestanding.h"
    "out/freestanding-c/slake_freestanding.h"
  ];
  # Toy strings prove fail-closed without mutating product C.
  toyCommentsOnly = ''
    /* int slake_linearFixtureMintId(slake_linear_cell **out) */
    // int slake_linearFixtureLiveView(slake_linear_cell **out)
    int leftover(void)
    {
      return 0;
    }
  '';
  toyBlockOnly = ''
    /*
    int slake_linearFixtureMintId(slake_linear_cell **out)
    int slake_linearFixtureLiveView(slake_linear_cell **out)
    int slake_linearFixtureSpentView(slake_linear_cell **cell)
    int slake_linearFixtureProgramReady_true(void)
    */
    int leftover(void) { return 0; }
  '';
  toyDefine = ''
    int slake_linearFixtureMintId(slake_linear_cell **out)
    {
      return 0;
    }
    int slake_linearFixtureLiveView(slake_linear_cell **out)
    {
      return 0;
    }
    int slake_linearFixtureSpentView(slake_linear_cell **cell)
    {
      return 0;
    }
    int slake_linearFixtureProgramReady_true(void)
    {
      return 1;
    }
  '';
  toyDeclare = ''
    int slake_linearFixtureMintId(slake_linear_cell **out);
    int slake_linearFixtureLiveView(slake_linear_cell **out);
    int slake_linearFixtureSpentView(slake_linear_cell **cell);
    int slake_linearFixtureProgramReady_true(void);
  '';
}
