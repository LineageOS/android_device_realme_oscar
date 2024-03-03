/*
 * Copyright (C) 2023 The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

#include <android-base/logging.h>
#include <android-base/properties.h>

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include <fstream>
#include <string>
#include <vector>

using android::base::GetProperty;

#define PROC_NFC_CHIPSET "/proc/oplus_nfc/chipset"

/*
 * SetProperty does not allow updating read only properties and as a result
 * does not work for our use case. Write "property_override" to do practically
 * the same thing as "SetProperty" without this restriction.
 */
void property_override(const std::string& prop, const std::string& value, bool add = true) {
    prop_info* pi = (prop_info*)__system_property_find(prop.c_str());
    if (pi != nullptr) {
        __system_property_update(pi, value.c_str(), value.length());
    } else if (add) {
        __system_property_add(prop.c_str(), prop.length(), value.c_str(), value.length());
    }
}

const std::vector<std::string> ro_props_default_source_order = {
    "bootimage.", "odm.", "product.", "system.",
    "system_ext.", "vendor.", "vendor_dlkm.", "",
};

/*
 * Only for read-only properties. Properties that can be wrote to more
 * than once should be set in a typical init script (e.g. init.oplus.hw.rc)
 * after the original property has been set.
 */
void set_device_properties() {
    auto prjname = GetProperty("ro.boot.prjname", "");
    for (const auto& source : ro_props_default_source_order) {
        if (prjname == "21707") { // IN
            property_override("ro.product." + source + "model", "RMX3471");
        } else if (prjname == "21708") { // EU
            property_override("ro.product." + source + "model", "RMX3472");
        } else if (prjname == "216EA") { // RU
            property_override("ro.product." + source + "model", "RMX3474");
        } else if (prjname == "2162B") { // CN
            property_override("ro.product." + source + "device", "RE547D");
            property_override("ro.product." + source + "model", "RMX3478");
        }
    }
}

/*
 * Setup NFC sku based on /proc/oplus_nfc/chipset 
 */
void check_nfc_support()
{
    std::ifstream procfile(PROC_NFC_CHIPSET);
    std::string chipset;

    getline(procfile, chipset);

    LOG(INFO) << "oplus_nfc : chipset " << chipset;

    if (chipset != "NULL") {
        property_override("ro.boot.product.hardware.sku", "nfc");
    }
}

void vendor_load_properties() {
    set_device_properties();
    check_nfc_support();
}
