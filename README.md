# ARM-print
<b>Note:</b> This is written for ARM (M1) assembly on Mac OS X.
<p>
  The file <tt>print.h</tt> defines two macros to make it easier
  to print a string from assembler.
</p>
The file <tt>printdemo.s</tt> shows an example:
<pre>
  #include "print.h"
  KPRINT hello
  B _exit
  KSTRING hello, "hello, world\n"
  _exit:
</pre>
<p>
  The output is (no prizes for guessing) <tt>hello, world</tt>
</p>
<p>
  Note that <tt>KSTRING</tt> defines a 0-terminated string in the
  text-segment (not in the data segment).  The implications are:
</p>
<ol>
  <li> The <tt>KPRINT</tt> macro can load the address for the string
    with <tt>ADR</tt> rather than in two steps with page/offset as
    is customary in Mac OS X.</li>
  <li> The string sits in the text-segment so you should either place
    it between subroutines, or at the end of the text-segment, or
    (as in the example) branch around it.  If you omit the branch statement,
    the ARM processor will start executing the string!</li>
  <li> Since the string is in the text-segment, it is read only.</li>
</ol>
<p>
  The <tt>KPRINT</tt> macro saves registers
  <tt>X0</tt>, 
  <tt>X1</tt>, 
  <tt>X2</tt>, 
  <tt>X16</tt> and
  <tt>LR</tt> on the stack first and restores them at the end.
  It uses the write system call to print the string &mdash;
  you can easily change it to work on, e.g., Linux.
</p>
<p>
  Possible extensions of this macro are
</p>
<ul>
  <li> Let <tt>KPRINT</tt>
    create the string using a local label, or one generated with
    the <tt>\@</tt> feature.</li>
  <li> Create <tt>printf</tt>-style macros for printing out register
    values in the string.<li>
</ul>
<p>
  The code is in public domain.
</p>
