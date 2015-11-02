local ammoclipping = NewRaycastWeaponBase.calculate_ammo_max_per_clip
function NewRaycastWeaponBase:calculate_ammo_max_per_clip()
	local ammo = tweak_data.weapon[self._name_id].CLIP_AMMO_MAX
	log ("[Ammo][1] " .. tostring(ammo))
	ammo = ammo * managers.player:upgrade_value(self._name_id, "mag_increase", 1)
	log(tostring(managers.player:upgrade_value(self._name_id, "mag_increase", 1)))
	log ("[Ammo][2] " .. tostring(ammo))
	if not self:upgrade_blocked("weapon", "mag_increase") then
		ammo = ammo * managers.player:upgrade_value("weapon", "mag_increase", 1)
	end
	if not self:upgrade_blocked(tweak_data.weapon[self._name_id].category, "mag_increase") then
		ammo = ammo * managers.player:upgrade_value(tweak_data.weapon[self._name_id].category, "mag_increase", 1)
	end
	log ("[Ammo][3] " .. tostring(ammo))
	ammo = math.floor(ammo + (self._extra_ammo or 0))
	log ("[Ammo][4] " .. tostring(ammo))
	log ("[SKILL?] " .. tostring(managers.player:upgrade_value("weapon", "mag_increase", 0)))
	return ammo
end