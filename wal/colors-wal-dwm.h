static const char norm_fg[] = "#e0afdb";
static const char norm_bg[] = "#100c19";
static const char norm_border[] = "#9c7a99";

static const char sel_fg[] = "#e0afdb";
static const char sel_bg[] = "#6E55D3";
static const char sel_border[] = "#e0afdb";

static const char urg_fg[] = "#e0afdb";
static const char urg_bg[] = "#6050C8";
static const char urg_border[] = "#6050C8";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
