-- local inspect = require('inspect') -- https://github.com/kikito/inspect.lua

function descriptor()
    return {
        title = 'Show Stream Title';
        version = '0.2 (dev)';
        author = 'Dae';
        url = 'https://github.com/EugeneDae/VLC-Show-Stream-Title';
        description = 'Shows the title of the currently playing video stream '
                   .. 'using the built-in OSD functionality of VLC.';
        shortdesc = 'Show Stream Title';
        capabilities = {}
    }
end

function main()
    local item = nil
    
    while true do
        if vlc.volume.get() == -256 then break end
        
        item = vlc.input.item()
        
        if item and vlc.playlist.status() == 'playing' then
            local meta = item:metas()
            
            if meta.url or ends_with(meta.filename, '.m3u8') then
                if not meta.custom_title then
                    local parent = get_parent_for(vlc.playlist.current())
                    
                    item:set_meta('custom_title', '(unknown)')
                    
                    if parent then
                        local parent_meta = parent.item:metas()
                        
                        if parent_meta.title then
                            item:set_meta('custom_title', parent_meta.title)
                        elseif meta.title then
                            item:set_meta('custom_title', meta.title)
                        end
                    end
                    
                    meta = item:metas()
                end
                
                vlc.osd.message(meta.custom_title, 9999, 'bottom', 1.5 * 1000000)
            end
        end
        
        sleep(1)
    end
end

function sleep(sec)
    vlc.misc.mwait(vlc.misc.mdate() + sec * 1000000)
end

function get_parent_for(item_id)
    local playlist = vlc.playlist.get()
    local result = nil
    
    function finder(item)
        if item.children then
            for _, v in ipairs(item.children) do                
                if v.id == item_id then
                    result = item
                    break
                end
                
                finder(v)
            end
        end 
    end
    
    finder(playlist)
    
    return result
end

function ends_with(str, ending)
   return ending == '' or str:sub(-#ending) == ending
end

main()
