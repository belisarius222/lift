/+  dbug, default-agent, verb
=*  card  card:agent:gall
=>
|%
+$  set-  [reps=@ud lbs=@ud]
+$  bell
  $~  %bb
  ?(~ %bb %db %kb)
::
+$  lift
  $?  %rows
      %bench
      %press
      %behind-the-neck-press
      %squat
      %dl
      %rdl
      %chinups
      %pullups
      %towel-pullups
      %pulldowns
      %pushdowns
      %french-curls
      %curls
      %hammer-curls
      %external-rotations
      %lateral-raises
      %flys
      %reverse-flys
      %lumbar-extensions
      %leg-press
      %hack-squat
      %ab-machine
      %cleans
      %snatches
      %getups
  ==
++  poke
  |%
  ::  lift: record a lift
  ::  drop: delete all lifts from a day
  ::
  +$  lift  [=^lift =bell sets=(list set-)]
  +$  drop  @da
  --
::
+$  agent-state
  $:  %0
      $=  lifts
      %+  map  @da
      %+  map  [=lift =bell]
      (list set-)
  ==
::
++  to-day
  =|  =tarp
  |=  now=@da
  ^-  @da
  (yule tarp(d d:(yell now)))
--
=|  state=agent-state
%-  agent:dbug
%+  verb  |
^-  agent:gall
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
::
++  on-init
  ^-  (quip card _this)
  `this
::
++  on-save  !>(state)
++  on-load
  |=  old=vase
  ^-  (quip card _this)
  `this(state !<(agent-state old))
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?+    mark  (on-poke:def mark vase)
      %lift
    =+  !<(=lift:poke vase)
    =/  today  (to-day now.bowl)
    =/  got  (~(gut by lifts.state) today ~)
    =.  lifts.state
      %+  ~(put by lifts.state)
        today
      =/  gat  (~(gut by got) [lift bell]:lift ~)
      %+  ~(put by got)
        [lift bell]:lift
      (weld sets.lift gat)
    ::
    ~&  [today (~(got by lifts.state) today)]
    `this
  ::
      %drop
    =+  !<(wen=@da vase)
    =/  day  (to-day wen)
    ~&  dropping/[day (~(get by lifts.state) day)]
    =.  lifts.state  (~(del by lifts.state) day)
    `this
  ==
::
++  on-peek
  |=  =path
  ^-  (unit (unit cage))
  ``lifts+!>(lifts.state)
::
++  on-watch  on-watch:def
++  on-leave  on-leave:def
++  on-agent  on-agent:def
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
--
