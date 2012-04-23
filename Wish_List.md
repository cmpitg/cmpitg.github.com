<title>"Wish List"</title>

<link rel="stylesheet" type="text/css" href="style.css" />

# Wish List

* Having an Emacs-like editor which

  - uses GTK+/Qt widgets, current farm-built widgets visually sucks;
  - has better Lisp dialect, I particularly love Clojure

* Having a GUI scripting language which

  - is thread-safe;
  - is high-performance;
  - simple and direct to use;
  - MVC-ed;
  
  Example: (Clojure-inspired syntax)
  
      ```clojure
      ;; (set-size win 200 300)
      ;; (set-layout _)
      ;; (add-child _)
      ;; (add-properties widget property-map)
      ;; (make-window _) => (make-widget :window _)

      {:property "main-window"
       :parent _name_
       :size _
       :layout _
       :children ["_", ...]}

      {:property "button-ok"
       :parent _name_
       :size}
      
      (def win (make-window {:size    [200 300]
                             :layout  :fill-layout
                             :title    "Hello world"
                             ;; Implicit: :name "main-window"

                             :children
                               [(def button-ok    (make-button {:text "OK"}))
                                (def button-quit  (make-button {:text "_Quit"}))]
                            }
                ))
      
      (add-event button-ok :clicked
        (fn [evt] (println "Said: Hello world!")))
      (add-event button-quit :clicked
        (fn [evt] (destroy win)))
      
      (prepare-window win) ;; Pack and open
      (start-gui win)
      ```

   Rules:
   * Except for display, every widget must have a parent.
   * Model-View-Controller is recommended way to create GUI.  Enforcing?


      ```Clojure
      ;; Hierarchy
      (def widgets-hierarchy
      )
      ```

   Frequently used widgets:
   * Window
   * Button
   * Label
   * TextBox
   * TextField
   * Menu
   * ScrollBar
   * TreeView
   * FileView
   * Icon
   * Image
   * Toolbar
