CloneClass(MenuCallbackHandler)
function MenuCallbackHandler:_increase_infamous(yes_clbk)
    if NMLR then
        if managers.experience:current_rank() >= NMLR.rank then
            managers.menu_scene:destroy_infamy_card()
            
            local max_rank = tweak_data.infamy.ranks
            
            if managers.experience:current_level() < 100 or max_rank <= managers.experience:current_rank() then
                return
            end
            
            local rank = managers.experience:current_rank() + 1
            managers.experience:set_current_rank(rank)
            
            managers.money:_set_offshore(NMLR.offshoreBonus)
            
            if managers.menu_component then
                managers.menu_component:refresh_player_profile_gui()
            end
            
            local logic = managers.menu:active_menu().logic
            
            if logic then
                logic:refresh_node()
                logic:select_item("crimenet")
            end
            
            managers.savefile:save_progress()
            managers.savefile:save_setting(true)
            managers.menu:post_event("infamous_player_join_stinger")
            
            if yes_clbk then
                yes_clbk()
            end
            
            if SystemInfo:distribution() == Idstring("STEAM") then
                managers.statistics:publish_level_to_steam()
            end
            
            return
        end
    end
    
    MenuCallbackHandler.orig._increase_infamous(self, yes_clbk)
end