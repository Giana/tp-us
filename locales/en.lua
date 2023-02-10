local Translations = {
    error = {
        args_required = 'All arguments required',
        getting_coords = 'Error getting coordinates',
        getting_player = 'Error getting player from id',
        getting_id = 'Error getting id'
    },
    other = {
        tp_yourself = 'Teleport yourself to coordinates',
        tp_yourself_x_name = 'x',
        tp_yourself_x_help = 'x coordinate',
        tp_yourself_y_name = 'y',
        tp_yourself_y_help = 'y coordinate',
        tp_yourself_z_name = 'z',
        tp_yourself_z_help = 'z coordinate',
        tp_someone = 'Teleport someone to coordinates',
        tp_someone_id_name = 'id',
        tp_someone_id_help = 'player ID',
        tp_someone_x_name = 'x',
        tp_someone_x_help = 'x coordinate',
        tp_someone_y_name = 'y',
        tp_someone_y_help = 'y coordinate',
        tp_someone_z_name = 'z',
        tp_someone_z_help = 'z coordinate'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})