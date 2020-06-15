static const char norm_fg[] = "#c7d7f2";
static const char norm_bg[] = "#4a7b91";
static const char norm_border[] = "#8b96a9";

static const char sel_fg[] = "#c7d7f2";
static const char sel_bg[] = "#9FC2F6";
static const char sel_border[] = "#c7d7f2";

static const char urg_fg[] = "#c7d7f2";
static const char urg_bg[] = "#9DC1F6";
static const char urg_border[] = "#9DC1F6";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};