local data = UpgradesTweakData.init
function UpgradesTweakData:init(tweak_data)
	data(self, tweak_data)
	
	self.values.player.percussive_maintenance = {0.35}
	self.definitions.player_percussive_maintenance = {
		category = "feature",
		name_id = "percussive_maintenance",
		upgrade = {
			category = "player",
			upgrade = "percussive_maintenance",
			value = 1
		}
	}
	
	self.values.weapon.drop_reload = {0.15, 0.3}
	self.values.team.weapon.drop_reload = {0.15}
	self.values.weapon.mag_increase = {1.22, 1.42}
	self.definitions.weapon_mag_increase_1 = {
		category = "feature",
		name_id = "mag_increase_1",
		upgrade = {
			category = "weapon",
			upgrade = "mag_increase",
			value = 1
		}
	}
	self.definitions.weapon_mag_increase_2 = {
		category = "feature",
		name_id = "mag_increase_2",
		upgrade = {
			category = "weapon",
			upgrade = "mag_increase",
			value = 2
		}
	}
	self.definitions.weapon_drop_reload_1 = {
		category = "feature",
		name_id = "drop_reload_1",
		upgrade = {
			category = "weapon",
			upgrade = "drop_reload",
			value = 1
		}
	}
	self.definitions.weapon_drop_reload_2 = {
		category = "feature",
		name_id = "drop_reload_2",
		upgrade = {
			category = "weapon",
			upgrade = "drop_reload",
			value = 2
		}
	}
	self.definitions.team_drop_reload = {
		category = "feature",
		name_id = "drop_reload_buff",
		upgrade = {
			category = "team",
			upgrade = "drop_reload",
			value = 1
		}
	}
end