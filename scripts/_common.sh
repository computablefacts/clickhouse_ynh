#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

#=================================================
# PERSONAL HELPERS
#=================================================

# Took from restic_ynh
# See: https://github.com/YunoHost-Apps/restic_ynh/blob/6891b390ede174f851dd4918439b5ecb61dcdec3/scripts/_common.sh#L50
_ynh_add_config_j2() {
    # Declare an array to define the options of this helper.
    local legacy_args=tdv
    local -A args_array=([t]=template= [d]=destination=)
    local template
    local destination
    # Manage arguments with getopts
    ynh_handle_getopts_args "$@"
    local template_path

    if [ -f "$YNH_APP_BASEDIR/conf/$template" ]; then
        template_path="$YNH_APP_BASEDIR/conf/$template"
    elif [ -f "$template" ]; then
        template_path=$template
    else
        ynh_die --message="The provided template $template doesn't exist"
    fi

    ynh_backup_if_checksum_is_different --file="$destination"

    # Make sure to set the permissions before we copy the file
    # This is to cover a case where an attacker could have
    # created a file beforehand to have control over it
    # (cp won't overwrite ownership / modes by default...)
    touch $destination
    chown root:root $destination
    chmod 640 $destination

    ynh_render_template "$template_path" "$destination"

    _ynh_apply_default_permissions $destination

    ynh_store_file_checksum --file="$destination"
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
