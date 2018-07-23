// @file:     electrode_poly_helper.h
// @author:   Nathan
// @created:  2018.07.17
// @editted:  2018.07.17 - Nathan
// @license:  GNU LGPL v3
//
// @desc:     Widget to create and edit polygonal electrodes

#ifndef _GUI_ELECTRODE_POLY_HELPER_H_
#define _GUI_ELECTRODE_POLY_HELPER_H_

// TODO includes
#include "../../global.h"
#include "primitives/electrode_poly.h"

namespace gui{

  class ElectrodePolyHelper : public QWidget
  {
    Q_OBJECT

  public:

    // constructor
    // TODO change active_afm_layer_index to pointer to layer manager
    ElectrodePolyHelper(QWidget *parent = 0);

    // destructor
    ~ElectrodePolyHelper();

    void addPoint(QPointF point);
    void clearPoints();
    void clearTrail();
    void showGhost(bool show);
    prim::PolygonHandle* ghostHandle(){return ghost_handle;}
    QList<QPointF> getPoints(){return points;}
    QList<prim::PolygonHandle*> getTrail(){return poly_trail;}
    prim::PolygonHandle* getLastHandle(){return poly_trail.last();}
    // tool change actions
    void toolChangeResponse(gui::ToolType tool_type);

  private:
    // VAR
    QList<prim::PolygonHandle*> poly_trail;
    QList<QPointF> points;
    prim::PolygonHandle* ghost_handle;
  };

} // end of gui namespace

#endif
