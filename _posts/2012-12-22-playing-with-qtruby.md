---
layout: post
title: Playing with QtRuby
tagline: "#!"
category: Programming
tags: [ruby, qt, espada]
last_updated: Sat, 22 Dec 2012 17:44:04 +0700
---
{% include JB/setup %}

Lately I have been spending time reading and playing with [QtRuby](http://techbase.kde.org/Development/Languages/Ruby).  I always want to learn about GUI programming and become an frequent user of a toolkit.  Web app is getting awesome than ever for both users and developers, but I still prefer traditional desktop app for personal use.  During the last 4 years, I have been watching and trying Gtk+, Tk, Fox Toolkit and wxWidgets, not to mention Swing and SWT.  I have my own problem with each of those toolkits that I didn't want to overcome since it's related to the way I want them to be used.  wxWidgets is influenced by [MFC](http://en.wikipedia.org/wiki/Microsoft_Foundation_Class_Library) which inherits a weird event passing system I've never got, besides the ability to uglify your code with a bunch of macros for declaring static event table.  Constructors in Fox Toolkit tend to have many arguments, unnecessarily requiring me to remember or lookup the documentation.  Gtk+ has many uncompleted bindings, undocumented features, and its way of making menu is really stupid; besides, I have to confess that I *hate* GNOME (no offense, I have no problem with GNOME people, just with the way the project works, especially when GNOME 3 comes out and the Miguel de Icaza incident).  Tk makes the most sense when it comes to prototyping and developing but has terrible look and feel.

Early this year, I tried to learn [Qt](http://qt-project.org/) didn't spend time to play with it since many of my projects tend to move to command-line or web-based interface.  With the [frustration with Emacs](/pages/emacs-vim-problems/) and [ideas for a new editor](/projects/espada-text.html), once again I'm on my way to find a better GUI toolkit.  After a while coming back to Gtk+ and [GObjectIntrospection](https://live.gnome.org/GObjectIntrospection/) with many bindings (the dead [Seed](https://live.gnome.org/Seed/), undocumented and uncompleted [Gjs](https://live.gnome.org/Gjs/), the leeky [node-gir](https://github.com/creationix/node-gir), [PyGobject](https://live.gnome.org/PyGObject), ...) with no better satisfaction, I decided to continue the Qt learning path I have stopped a while ago.  Among GUI toolkits I have tried, along with Tk, Qt APIs look natural to me the most, with the seem-to-be-completed [Ruby binding](http://techbase.kde.org/Development/Languages/Ruby).  Here are some notes from the last few days, focusing not on QtRuby but the way it's used as a middle-ware and the possibility of quickly implementing it:

(*Note:* I know Ruby veterans would probably criticize me for bad coding style.  I have no excuse.  I just want to experiment with my own convention for my future piece of software.)

### First thoughts - `expectation1.rb`

- Top-down
- Declarative style (*not* [declarative GUI programming](http://c2.com/cgi/wiki?DeclarativeGUI)): possibility, rules, and elegant (Ruby literal)?
- JSON for generalization and [IPC](http://en.wikipedia.org/wiki/Inter-process_communication)?
- MVC?
- Naming the thing?

{% highlight ruby %}
#
# ./expectation.rb
#
# ---
#
# GUI programming - First thoughts - Abandoned after 
#
# Steps:
#
#   0. Creating helpers
#   1. Creating widgets & setting independent properties
#   2. Setting properties which depend on other widget, i.e. properties which
#      could only be set when widget creation is done.
#   2. Layout
#   3. Connecting signals
#
# Fundamental methods:
#
# `new` creates widgets and returns a class used to manage created
# widgets of `:id`s as keys.
#
# `set_prop` sets the properties of a widget
#
# `set_props` sets the properties of widgets
#
# `set_layout` sets the layout of the widgets
#
#
# Notes:
# 
# * Widget layout and propeties are described using hashtable/JSON
# * `contructor` is a function used to construct the widget, when it exists
#   *all properties in the hashtable are disregarded*
# * If widgets with the ID `:_fuzzy_` would have no ID
# * Think of how you structure stuff with HTML
# * If a container contains a containers, use hashtable, otherwise, use array
# * `pre_constructor`, `post_constructor` and `constructor`, refers to itself
#   using `self`
#
# Convention:
#
# * "mainWindow" ~ "main_window" ~ "main-window"
# * It's recommended to use declarative style whenever possible
#

#
# Helpers
#

#
# Creating widgets
#

widgets_desc = [
  {
    :id => :main_window,
    :type => :window
    :width => default_width,
    :height => default_height,
    :pos_x => center[:x],
    :pos_y => center[:y],
    :font => Qt::Font('Monaco', 18, Qt::Font::Bold)
  },

  {
    :id => :quit,
    :type => :push_button,
    :text => "Quit"
  }
]

widgets2_desc = [
  {
    :id => :main_window,
    :constructor => lambda {
      me = Qt::Widget.new {
        resize default_width, default_height
        move center[:x], center[:y]
        set_font Qt::Font('Monaco', 18, Qt::Font::Bold)
      }
      me
    }
  },

  {
    :id => :quit,
    :constructor => lambda {
      me = Qt::PushButton.new {
        me.set_text "Quit"
      }
      me
    }
  }
]

#
# Layout
#

layout_desc = {
  :main_window => {
    :vbox => [
      :quit,
      :slider,
      :spinbox
    ]
  }
}

widgets = EspadaGUI.new widgets2_desc
widgets = EspadaGUI.new widgets2_desc, layout2_desc

widgets.set_prop {
  :main_window => {
    :width => 450,
    :height => 300,
  },

  :quit_button => {
    :font => Font.new('Monaco', 20)
  }

  :slider => {
    :size => [20, 30]
  }
}

widgets.set_prop :main_window, { :size => [400, 300] }

widgets.get_prop :main_window, :size    # [400, 300]
widgets.get_prop :main_window, :width   # 400
widgets.get_prop :main_window, :height  # 300

widgets.get_widget :main_window         # <Widget>
widgets[:main_window]                   # <Widget>

widgets[:main_window].set :height, 250
widgets[:main_window].set_height 250

widgets[:main_window].set_layout :vbox
widgets[:main_window].set_layout widgets[:vbox]

widgets[:vbox].add_widget :quit
widgets[:vbox].add_widget widgets[:quit]

widgets.set_layout layout_desc
widgets.set_layout {
  :main_window => {
    :vbox => [
      :quit,
      :slider,
      :spinbox,
      :lcd
    ]
  }
}

#
# Is this good? -> Confusing between hashtable and array.
#
# Ruby doesn't have pair datastructure, and of course no literal.
#
# How about this?
#
# Notes
#
# * More like a pattern than a helper
#
# * Whenever you want to modify something, open a class, make a method,
#   and close it
#
# * Properties could be set using hashtable
#
# * The code below doesn't work due to instance_eval -> switching to
#   alternative method using Ruby meta programming
#

class MyGUI
  attr_accessor @app, @main_window, @quit, @vbox

  def create_widgets
      @main_window = Window.new {
        resize default_width, default_height
        move center[:x], center[:y]
        set_font Font.new('Monaco', 18, Font::Bold)
        show
      }

      @quit = PushButton.new

      @app = $qApp
  end

  def arrange
    @vbox = VBoxLayout.new {
      add_widget @quit
    }

    @main_window.set_layout @vbox
  end

  def connect_signals
    GUIObject::connect @main_window, 'clicked()', @app, 'quit()'
  end
end

widgets = MyGUI.create_widgets
widgets.arrange
widgets.connect_signals

{% endhighlight %}

### Second thoughts - `expectation2.rb`

- Bottom-up
- Ruby metaprogramming helps?
- No JSON, no declarative style yet
- Still quick and dirty

{% highlight ruby %}
#
# ./expectation2.rb
#
# ---
#
# GUI programming - Second thoughts -> Emphasizing convention
#
# Steps:
#
#   0. Creating helpers
#   1. Creating widgets & setting independent properties
#   2. Setting properties which depend on other widget, i.e. properties which
#      could only be set when widget creation is done.
#   2. Layout
#   3. Connecting signals
#
# Notes
#
# * Convention over configuration, order of loading (global first, local later)
#   - Plugins
#   - Syntax
#   - GUI config file
#   - Keyboard config file
#   - Mouse config file
#   - Misc config file (not really recommended)
#
# * JSON vs. Ruby code?  Both?  Load JSON first, Ruby later? => Giving too much power?
#
#
# Renaming classes - why?
#
# * GUI *is* an essential part of the text editor, so why `EspadaFont` or
#   `EspFont` or `GUIFont`?  Just `Font` itself makes pretty much sense
#
# Espada component resides in a different namespace => better encapsulation
# => module `Espada`
#

#
# GUI helpers
#

require 'Qt4'

#
# Classes renaming

class Font < Qt::Font
end

class Window < Qt::Widget
end

class Application < Qt::Application
end

class GUIObject < Qt::Object
  # def connect(sender, signal_str, receiver, slot_str)
  #   super sender, SIGNAL(signal_str), receiver, SLOT(slot_str)
  # end
end

class VBoxLayout < Qt::VBoxLayout
end

class HBoxLayout < Qt::HBoxLayout
end

class PushButton < Qt::PushButton
end

{% endhighlight %}

### Try them out:

#### Example #1: Ugly, no metaprogramming (no evil)

{% highlight ruby %}
#
# ./tryout_hello1.rb
#
# ---
#

require './expectations2'

def create_GUI
  #
  # Create widgets
  #

  win = Window.new {
    resize 400, 300
    move 200, 100
    set_font Font.new('Monaco', 18, Font::Bold)
    show
  }

  quit = PushButton.new 'Quit'

  app = $qApp

  #
  # Arrange
  #

  vbox = VBoxLayout.new {
    add_widget quit
  }

  win.set_layout vbox

  #
  # Connect signals
  #

  GUIObject::connect quit, SIGNAL('clicked()'), $qApp, SLOT('quit()')

  #
  # Return
  #

  {
    :win   => win,
    :quit  => quit,
    :app   => app
  }
end

app = Application.new ARGV
GUI = create_GUI
app.exec

{% endhighlight %}

#### Example #2: A bit better, with metaprogramming (evil)

{% highlight ruby %}
#
# ./tryout_hello2.rb
#
# ---
#

require './expectations2'

class MyGUI
  attr_accessor :widgets

  win = nil
  quit = nil
  app = nil
  vbox = nil

  define_method :create do
    win = Window.new {
      resize 400, 300
      move 200, 100
      set_font Font.new('Monaco', 18, Font::Bold)
      show
    }

    quit = PushButton.new 'Quit'

    app = $qApp
  end

  define_method :arrange do
    vbox = VBoxLayout.new {
      add_widget quit
    }

    win.set_layout vbox
  end

  define_method :connect_signals do
    GUIObject::connect quit, SIGNAL('clicked()'), $qApp, SLOT('quit()')
  end

  define_method :initialize do
    create
    arrange
    connect_signals

    @widgets = {
      :win => win,
      :quit => quit,
      :vbox => vbox
    }
  end
end

class << MyGUI
  define_method :get_widgets do
    widgets = widgets || MyGUI.new.widgets
    widgets
  end
end

app = Application.new ARGV
# GUI = MyGUI.new
# puts GUI.widgets.inspect
widgets = MyGUI::get_widgets
puts widgets.inspect
app.exec

#
# Achivements
#
# * Shared variable in an object
# * Good for user and hacker
# * Singleton
# * Extending -> DSL?
#
# Bad:
#
# * Evil meta-programming
# * Looks fragmented
#
{% endhighlight %}

Well, that's it for now!  