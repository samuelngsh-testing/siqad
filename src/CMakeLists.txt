cmake_minimum_required(VERSION 3.10)

# for release builds, add flag "-DCMAKE_BUILD_TYPE=Release" (without quotes) when running cmake.

project(siqad VERSION 0.2.0)
# TODO add way to push version number into source code

find_package(Qt5Core ${QT_VERSION_REQ} REQUIRED)
find_package(Qt5Gui ${QT_VERSION_REQ} REQUIRED)
find_package(Qt5Widgets ${QT_VERSION_REQ} REQUIRED)
find_package(Qt5Svg ${QT_VERSION_REQ} REQUIRED)
find_package(Qt5PrintSupport ${QT_VERSION_REQ} REQUIRED)
find_package(Qt5UiTools ${QT_VERSION_REQ} REQUIRED)
find_package(Qt5Charts ${QT_VERSION_REQ} REQUIRED)

add_definitions( -DAPP_VERSION=\"0.1.0\" -DAPPLICATION_NAME=\"SiQAD\" -DORGANIZATION_NAME=\"WalusLab\" )

qt5_add_resources(CUSTOM_RSC resources/application.qrc)
#qt5_add_binary_resources(bin_resources resources/application.qrc OPTIONS -no-compress)
#add_dependencies(siqad bin_resources)

if(CMAKE_BUILD_TYPE MATCHES Debug)
    set(SIQAD_INSTALL_ROOT "debug" CACHE STRING "SiQAD install root directory name")
else()
    set(SIQAD_INSTALL_ROOT "release" CACHE STRING "SiQAD install root directory name")
endif()

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
#set(CMAKE_CXX_FLAGS "-Wall -Wextra")
#set(CMAKE_CXX_FLAGS_DEBUG "-g")
#set(CMAKE_CXX_FLAGS_RELEASE "-O3")
set(QT_VERSION_REQ "5.2")
#set(MAKE_INCLUDE_CURRENT_DIR ON)

set(SOURCES
    main.cc
    global.cc
    #resources/application.qrc
    # settings
	settings/settings.cc
	settings/settings_dialog.cc
    # primitives for widgets
    gui/widgets/primitives/emitter.cc
   	gui/widgets/primitives/item.cc
   	gui/widgets/primitives/aggregate.cc
   	gui/widgets/primitives/dbdot.cc
   	gui/widgets/primitives/ghost.cc
   	gui/widgets/primitives/layer.cc
   	gui/widgets/primitives/lattice.cc
   	gui/widgets/primitives/electrode.cc
   	gui/widgets/primitives/afmarea.cc
   	gui/widgets/primitives/afmpath.cc
   	gui/widgets/primitives/afmnode.cc
   	gui/widgets/primitives/afmseg.cc
    gui/widgets/primitives/pot_plot.cc
    gui/widgets/primitives/resizablerect.cc
    gui/widgets/primitives/resizerotaterect.cc
   	gui/widgets/primitives/hull/hull.cc
   	gui/widgets/primitives/hull/convex.cc
    gui/widgets/primitives/labels/labelgroup.cc
    gui/widgets/primitives/labels/textlabel.cc
    gui/widgets/primitives/visual_aids/screenshot_clip_area.cc
    gui/widgets/primitives/visual_aids/scale_bar.cc
    #components for widgets
   	gui/widgets/components/plugin_engine.cc
    #gui/widgets/components/sim_engine.cc
   	gui/widgets/components/sim_job.cc
    gui/widgets/components/job_results/job_result.cc
    gui/widgets/components/job_results/db_locations.cc
    gui/widgets/components/job_results/electron_config_set.cc
    gui/widgets/components/job_results/potential_landscape.cc
    gui/widgets/components/job_results/sqcommands.cc
    # widgets
    gui/application.cc
   	gui/commander.cc
   	gui/property_map.cc
   	gui/widgets/property_editor.cc
   	gui/widgets/property_form.cc
   	gui/widgets/design_panel.cc
   	gui/widgets/dialog_panel.cc
   	gui/widgets/input_field.cc
   	gui/widgets/info_panel.cc
    gui/widgets/afm_panel.cc
    gui/widgets/color_dialog.cc
    gui/widgets/rotate_dialog.cc
   	gui/widgets/completer.cc
   	gui/widgets/managers/item_manager.cc
    gui/widgets/managers/layer_manager.cc
    gui/widgets/managers/plugin_manager.cc
    gui/widgets/managers/job_manager.cc
    gui/widgets/managers/sim_manager.cc
    gui/widgets/managers/screenshot_manager.cc
    gui/widgets/visualizers/sim_visualizer.cc
    gui/widgets/visualizers/electron_config_set_visualizer.cc
    gui/widgets/visualizers/potential_landscape_visualizer.cc
)

include_directories(
    .
    settings
    gui
    gui/widgets
    gui/widgets/managers
    gui/widgets/visualizers
    gui/widgets/primitives
   	gui/widgets/components
)

set(CMAKE_AUTOMOC ON)
#set(CMAKE_AUTORCC ON)

add_executable(siqad WIN32 ${SOURCES} ${CUSTOM_RSC})
# for windows, add WIN32 to avoid the console window showing up
#add_executable(siqad WIN32 ${SOURCES} ${CUSTOM_RSC})
#add_executable(siqad ${SOURCES})
#add_dependencies(siqad bin_resources)

target_link_libraries(${PROJECT_NAME}
    Qt5::Core
    Qt5::Gui
    Qt5::Widgets
    Qt5::Svg
    Qt5::PrintSupport
    Qt5::UiTools
    Qt5::Charts
)

#install(TARGETS simanneal RUNTIME DESTINATION ${CMAKE_BUILD_TYPE}/phys/simanneal)
#install(FILES sim_anneal.physeng DESTINATION ${CMAKE_BUILD_TYPE}/phys/simanneal)
install(TARGETS siqad RUNTIME DESTINATION ${SIQAD_INSTALL_ROOT})
install(FILES phys/is_python3.py phys/README.md DESTINATION ${SIQAD_INSTALL_ROOT}/phys)
