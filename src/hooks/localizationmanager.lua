local localization_manager_text_clone = LocalizationManager.text
function LocalizationManager:text(string_id, macros)
    if NMLR then
        if managers.experience:current_rank() >= NMLR.rank then
            if string_id == "menu_infamy_go_infamous_error_money" then
                return "You must have at least " .. NMLR.offshoreCostText .. " on your offshore account to go infamous."
            elseif string_id == "menu_dialog_become_infamous_3_above_5" then
                return "Becoming infamous is going to cost you all your offshore money.\nYour level, skill trees, profiles and cash will be preserved.\nYou will retrieve " .. NMLR.offshoreBonusText .. " offshore."
            end
        end
    end
    
    return localization_manager_text_clone(self, string_id, macros)
end