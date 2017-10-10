// @file:     sim_manager.h
// @author:   Samuel
// @created:  2017.09.27
// @editted:  2017.09.27 - Samuel
// @license:  GNU LGPL v3
//
// @desc:     window that allows users to setup and dispatch new simulations,
//            as well as manage ongoing or completed simulations.

#ifndef _GUI_SIM_MANGER_H_
#define _GUI_SIM_MANGER_H_

#include <QtWidgets>
#include "primitives/simulator.h"

namespace gui{

class SimManager : public QWidget
{
  Q_OBJECT

public:

  // constructor
  SimManager(QWidget *parent = 0);

  // destructor
  ~SimManager();

  // show manager dialog
  void showManager() {show();}

  // manager actions
  void newSimSetup();               // walks user through simulation setup

private:
  void initSimManager();
  void initMenu();
  void initListPan();
  void initSimActionsPan();
  void fetchSimList();

  void simParamSetup();             // take user options for simulation parameters
  bool exportSimProblem();          // generate problem XML
  void invokeSimulator();           // call simulator to run problem XML
  bool checkSimCompletion();        // check whether simulation has been completed

  // variables
  QStack<prim::Simulator*> simulators;   // stack of all simulators

  // manager panes
  QListWidget *sim_list_pan;
  QVBoxLayout*sim_actions_pan;
};


} // end gui namespace

#endif