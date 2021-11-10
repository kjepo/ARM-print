# ARM-print
<b>Note:</b> This is written for ARM (M1) assembly on Mac OS X.
<p>
  The file <tt>kprint.s</tt> define a macro to make it easier
  to print a string from assembler.
</p>
The file <tt>printdemo.s</tt> shows an example:
<pre>
  #include "kprint.s"
  KPRINT "hello, world\n"
  KPRINT "goodbye cruel world\n"
</pre>
<p>
  The output is:
</p>
<pre>
hello, world
goodbye cruel world
</pre>
<p>
  Note that <tt>KPRINT</tt> defines the string in the
  text-segment (not in the data segment).  The implications are:
</p>
<ol>
  <li> The <tt>KPRINT</tt> macro can load the address for the string
    with <tt>ADR</tt> rather than in two steps with page/offset as
    is customary in Mac OS X.</li>
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
  A possible extensions of this macro is to
  create <tt>printf</tt>-style macros for printing
  out register values in the string.
</p>
<p>
  The code is in public domain.
</p>
