local data = BaseInteractionExt._get_timer()
function BaseInteractionExt:_get_timer()
	data(self)
	local modified_timer = self:_get_modified_timer()
	if modified_timer then
		return modified_timer
	end
	local multiplier = 1
	if self._tweak_data.upgrade_timer_multiplier then
		multiplier = multiplier * managers.player:upgrade_value(self._tweak_data.upgrade_timer_multiplier.category, self._tweak_data.upgrade_timer_multiplier.upgrade, 1)
	end
	if self._tweak_data.upgrade_timer_multipliers then
		for _, upgrade_timer_multiplier in pairs(self._tweak_data.upgrade_timer_multipliers) do
			multiplier = multiplier * managers.player:upgrade_value(upgrade_timer_multiplier.category, upgrade_timer_multiplier.upgrade, 1)
		end
	end
	if managers.player:has_category_upgrade("player", "interaction_speed") then
		local data = managers.player:upgrade_value("player", "interaction_speed") or {}
		local player_level = managers.experience:current_level() or 0
		multiplier = multiplier * (1 - (data[1] or 0) * math.ceil(player_level / (data[2] or 1)))
	end
	return self:_timer_value() * multiplier * managers.player:toolset_value()
end