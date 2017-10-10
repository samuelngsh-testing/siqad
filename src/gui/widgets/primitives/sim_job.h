// @file:     sim_job.h
// @author:   Samuel
// @created:  2017.10.10
// @editted:  2017.10.10 - Samuel
// @license:  GNU LGPL v3
//
// @desc:     SimJob object that describes a simulation job and stores the results from that job

#ifndef _PRIM_SIM_JOB_H_
#define _PRIM_SIM_JOB_H_

#include <QtWidgets>
#include <QtCore>
#include "sim_engine.h"
#include "src/settings/settings.h" // TODO probably need this later

namespace prim{

  class SimJob : public QObject
  {
    Q_OBJECT
  public:
    // constructor
    SimJob(SimEngine *eng, QWidget *parent=0);

    // destructor
    ~SimJob() {};

    // call sim engine binary
    // probably makes sense to put this here as the same simulator binary could be used for multiple jobs
    void invokeBinary();

    // read result XML TODO maybe move to private
    void readResults(QString read_path);

    

  private:
    SimEngine *engine;
    //QList<QPair<the field stuff, value>> sim_params;
    //QList of results. For now: 1. db physloc, 2. db config
  };

} // end of prim namespace

#endif