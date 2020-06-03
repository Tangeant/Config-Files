const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#4a7b91", /* black   */
  [1] = "#9DC1F6", /* red     */
  [2] = "#9FC2F6", /* green   */
  [3] = "#9EC2F6", /* yellow  */
  [4] = "#98C4F6", /* blue    */
  [5] = "#9AC4F6", /* magenta */
  [6] = "#A0C0F6", /* cyan    */
  [7] = "#c7d7f2", /* white   */

  /* 8 bright colors */
  [8]  = "#8b96a9",  /* black   */
  [9]  = "#9DC1F6",  /* red     */
  [10] = "#9FC2F6", /* green   */
  [11] = "#9EC2F6", /* yellow  */
  [12] = "#98C4F6", /* blue    */
  [13] = "#9AC4F6", /* magenta */
  [14] = "#A0C0F6", /* cyan    */
  [15] = "#c7d7f2", /* white   */

  /* special colors */
  [256] = "#4a7b91", /* background */
  [257] = "#c7d7f2", /* foreground */
  [258] = "#c7d7f2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
