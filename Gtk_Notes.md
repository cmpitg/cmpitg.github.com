* How to use `GtkAlignment`:

  - Add container to `GtkAlignment`
  - Alignment configuration:
    * Top-left: 0, 0, _, _
    * Top-right: 1, 0, _, _
    * Bottom-left: 0, 1, _, _
    * Bottom-right: 1, 1, _, _
  - Alignments are greedy, i.e. they fill up all the space they're
    allowed to consume.  So it could be use to fill space.

* `GtkBox`:

  - Single row container
  - Children are allocated equal space: `homogeneous = true`
    Else: `homogeneous = false`

* `GtkTable` are evil, (FIXME: Why?) you should use `GtkVBox` and `GtkHBox` instead.

* Packing explanation:

  `pack_start object, is_cell_gived_equal_space?, does_widget_fill_cell?, padding`
