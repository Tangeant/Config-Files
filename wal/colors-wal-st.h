const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0d0d0b", /* black   */
  [1] = "#584E46", /* red     */
  [2] = "#675A51", /* green   */
  [3] = "#71645B", /* yellow  */
  [4] = "#766A63", /* blue    */
  [5] = "#916E58", /* magenta */
  [6] = "#B98E70", /* cyan    */
  [7] = "#b3b5b8", /* white   */

  /* 8 bright colors */
  [8]  = "#7d7e80",  /* black   */
  [9]  = "#584E46",  /* red     */
  [10] = "#675A51", /* green   */
  [11] = "#71645B", /* yellow  */
  [12] = "#766A63", /* blue    */
  [13] = "#916E58", /* magenta */
  [14] = "#B98E70", /* cyan    */
  [15] = "#b3b5b8", /* white   */

  /* special colors */
  [256] = "#0d0d0b", /* background */
  [257] = "#b3b5b8", /* foreground */
  [258] = "#b3b5b8",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
