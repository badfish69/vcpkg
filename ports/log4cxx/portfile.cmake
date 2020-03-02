
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO badfish69/logging-log4cxx
    REF v0_11_0-20200303
    SHA512  a43688a7b6b42b8d7ae3d97f26af52ed546cdd8ed7d734a5e3b7fc5078aa7e441fc566d60fcc27b9356046c4571634ec3b90e1965759b10473c16b522cacc592
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DLOG4CXX_INSTALL_PDB=ON
)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

if(VCPKG_LIBRARY_LINKAGE STREQUAL static)
    file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/bin ${CURRENT_PACKAGES_DIR}/debug/bin)
endif()

vcpkg_copy_pdbs()

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
