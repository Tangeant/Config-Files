const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#100c19", /* black   */
  [1] = "#6050C8", /* red     */
  [2] = "#6E55D3", /* green   */
  [3] = "#8F3D82", /* yellow  */
  [4] = "#A1549B", /* blue    */
  [5] = "#E26EAB", /* magenta */
  [6] = "#9B5FCE", /* cyan    */
  [7] = "#e0afdb", /* white   */

  /* 8 bright colors */
  [8]  = "#9c7a99",  /* black   */
  [9]  = "#6050C8",  /* red     */
  [10] = "#6E55D3", /* green   */
  [11] = "#8F3D82", /* yellow  */
  [12] = "#A1549B", /* blue    */
  [13] = "#E26EAB", /* magenta */
  [14] = "#9B5FCE", /* cyan    */
  [15] = "#e0afdb", /* white   */

  /* special colors */
  [256] = "#100c19", /* background */
  [257] = "#e0afdb", /* foreground */
  [258] = "#e0afdb",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
