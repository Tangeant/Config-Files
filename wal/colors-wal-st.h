const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#1c1922", /* black   */
  [1] = "#3E4583", /* red     */
  [2] = "#5E669C", /* green   */
  [3] = "#7D83B6", /* yellow  */
  [4] = "#8E8BB8", /* blue    */
  [5] = "#B8A7C9", /* magenta */
  [6] = "#FED1CE", /* cyan    */
  [7] = "#f6e9e1", /* white   */

  /* 8 bright colors */
  [8]  = "#aca39d",  /* black   */
  [9]  = "#3E4583",  /* red     */
  [10] = "#5E669C", /* green   */
  [11] = "#7D83B6", /* yellow  */
  [12] = "#8E8BB8", /* blue    */
  [13] = "#B8A7C9", /* magenta */
  [14] = "#FED1CE", /* cyan    */
  [15] = "#f6e9e1", /* white   */

  /* special colors */
  [256] = "#1c1922", /* background */
  [257] = "#f6e9e1", /* foreground */
  [258] = "#f6e9e1",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
