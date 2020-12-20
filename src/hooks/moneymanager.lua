CloneClass(MoneyManager)
function MoneyManager:get_infamous_cost(rank)
    if NMLR then
        if rank > NMLR.rank then
            return NMLR.offshoreCost
        end
    end
    
    return MoneyManager.orig.get_infamous_cost(self, rank)
end