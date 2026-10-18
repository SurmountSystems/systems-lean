# SPDX-License-Identifier: Unlicense
# Data for the named linear fixture C *calls* gate. Product .c call sites.
# Occupancy 49. FullHost false. Do not mill. Do not regenerate.
# Scan generated product C, not SSOT. This gate does not weaken defs.
{
  fixtureNames = [
    "slake_linearFixtureMintId"
    "slake_linearFixtureLiveView"
    "slake_linearFixtureSpentView"
    "slake_linearFixtureProgramReady_true"
  ];
  callRels = [
    "src/systems/emit/slake_freestanding.c"
    "out/freestanding-c/slake_freestanding.c"
  ];
  # Toy strings prove fail-closed without mutating product C.
  toyCommentsOnly = ''
    /* rc = slake_linearFixtureMintId(&cell); */
    // rc = slake_linearFixtureLiveView(&cell);
    int leftover(void)
    {
      return 0;
    }
  '';
  toyBlockOnly = ''
    /*
    rc = slake_linearFixtureMintId(&cell);
    rc = slake_linearFixtureLiveView(&cell);
    rc = slake_linearFixtureSpentView(&cell);
    return slake_linearFixtureProgramReady_true();
    */
    int leftover(void) { return 0; }
  '';
  toyDefsOnly = ''
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
  toyCalls = ''
    int slake_linearFixtureUse(void)
    {
      slake_linear_cell *cell;
      int rc;
      cell = 0;
      rc = slake_linearFixtureMintId(&cell);
      rc = slake_linearFixtureLiveView(&cell);
      rc = slake_linearFixtureSpentView(&cell);
      return slake_linearFixtureProgramReady_true();
    }
  '';
}
