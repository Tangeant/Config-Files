static const char norm_fg[] = "#f6e9e1";
static const char norm_bg[] = "#1c1922";
static const char norm_border[] = "#aca39d";

static const char sel_fg[] = "#f6e9e1";
static const char sel_bg[] = "#5E669C";
static const char sel_border[] = "#f6e9e1";

static const char urg_fg[] = "#f6e9e1";
static const char urg_bg[] = "#3E4583";
static const char urg_border[] = "#3E4583";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
