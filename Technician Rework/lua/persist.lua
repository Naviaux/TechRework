if not tweak_data then return end

LocalizationManager:add_localized_strings({
	["menu_tech_rework"] = "Unlocking the Technician",
	["menu_tech_rework_desc"] = "The Technician is an expert in the practical application of criminal science, enjoying anything that goes BOOM!\n\nSpending the first point in the Technician skill tree unlocks the ability to place the trip mine deployable. The trip mine can be used to blow things up, like people and safes.\n\n$multibasic; trip mines are added to your inventory.\nTrip mines can be turned on and off.",
	["menu_technician_left_1"] = "Unavailable",
	["menu_technician_left_1_desc"] = "This skill has not been completed and is not recommended to be specialized in",
	["menu_technician_mid_1"] = "Combat Engineer",
	["menu_technician_mid_1_desc"] = "BASIC: 1 point / $4,500\nUpgrades your trip mines with a sensor mode, highlighting enemies that walk past. During stealth, the trip mines will highlight guards and special enemies for your crew.\n\nIf stealth is not an option, the trip mines will highlight special enemies for you and your crew.\n\nACE: 3 points / $12,500\nSpecial enemies marked by your trip mines take 15% more damage",
	["menu_technician_right_1"] = "Nerves of Steel",
	["menu_technician_right_1_desc"] = "",
	["menu_technician_left_2"] = "Unavailable",
	["menu_technician_left_2_desc"] = "This skill has not been completed and is not recommended to be specialized in",
	["menu_technician_mid_2"] = "Blast Radius",
	["menu_technician_mid_2_desc"] = "BASIC: 1 point / $28,500\nThe radius of trip mine explosions are increased by 30%\n\nACE: 3 points / $84,500\nThe radius of trip mine explosions are increased by an additional 70%",
	["menu_technician_right_2"] = "Hardware Expert",
	["menu_technician_right_2_desc"] = "BASIC: 1 point / $28,500\nYou fix the drill 25% faster and you also deploy trip mines 40% faster.\n\nACE: 3 points / $84,500\nGives your drill a 30% chance to autorestart when it breaks down. You also deploy the sentry gun 50% faster.",
	["menu_technician_left_3"] = "Sentry Gun",
	["menu_technician_left_3_desc"] = "BASIC: 1 point / $56,500\nUnlocks the sentry gun for you to use.\n\nACE: 3 points / $168,500\nYour sentry gun accuracy is increased by 100% and it's rotational speed is increased by 150%",
	["menu_technician_mid_3"] = "Jack of All Trades",
	["menu_technician_mid_3_desc"] = "BASIC: 1 point / $56,500\nThis has not been implemented yet\n\nACE: 3 points / $168,500\nYou can carry sentry guns and trip mines at the same time. When you deplete your trip mines or sentry guns you will switch to the other one.\n\nNote: You need a sentry gun for this skill to work.",
	["menu_technician_right_3"] = "",
	["menu_technician_right_3_desc"] = "",
	["menu_technician_left_4"] = "Sentry Combat Upgrade",
	["menu_technician_left_4_desc"] = "BASIC: 4 points / $336,500\nYour sentry gun is loaded with 50% extra ammo.\n\nACE: 8 points / $672,500\nYou can now reload your sentry gun with your own ammo.",
	["menu_technician_mid_4"] = "Shaped Charge",
	["menu_technician_mid_4_desc"] = "BASIC: 4 points / $336,500\nTrip mines can now be converted to shaped charges, used to breach certain safes and doors.\n\nACE: 8 points / $672,500\nAdds 4 more trip mines to your inventory.",
	["menu_technician_right_4"] = "",
	["menu_technician_right_4_desc"] = "",
	["menu_technician_left_5"] = "Sentry Tower Defense",
	["menu_technician_left_5_desc"] = ""
	
})

local editable_skill_descs = {
	tech_rework = {
		{"2"},
		{""}
	},
	tech_right_1 = {
		{"15"},
		{""}
	}
}

for skill_id, skill_desc in pairs(editable_skill_descs) do
	tweak_data.upgrades.skill_descs[skill_id] = {}
	for index, skill_version in ipairs(skill_desc) do
		local version = index == 1 and "multibasic" or "multipro"
		tweak_data.upgrades.skill_descs[skill_id][index] = #skill_version
		for i, desc in ipairs(skill_version) do
			if i ~= 1 or not "" then
			end
			tweak_data.upgrades.skill_descs[skill_id][version .. tostring(i)] = desc
		end
	end
end

tweak_data.skilltree.skills.technician.name_id = "menu_technician"

tweak_data.skilltree.skills.tech_rework = {
	["name_id"] = "menu_tech_rework",
	["desc_id"] = "menu_tech_rework_desc",
	["icon_xy"] = {7, 4},
	[1] = {
		upgrades = {
			"trip_mine",
			"trip_mine_can_switch_on_off"
		},
		cost = tweak_data.skilltree.costs.unlock_tree,
		desc_id = "menu_technician_tier_1"
	},
	[2] = {
		upgrades = {},
		desc_id = "menu_technician_tier_2"
	},
	[3] = {
		upgrades = {},
		desc_id = "menu_technician_tier_3"
	},
	[4] = {
		upgrades = {},
		desc_id = "menu_technician_tier_4"
	},
	[5] = {
		upgrades = {},
		desc_id = "menu_technician_tier_5"
	},
	[6] = {
		upgrades = {},
		desc_id = "menu_technician_tier_6"
	}
}
 -- Unknown
tweak_data.skilltree.skills.tech_left_1 = {
	["name_id"] = "menu_technician_left_1",
	["desc_id"] = "menu_technician_left_1_desc",
	["icon_xy"] = {0, 0},
	[1] = {
		upgrades = {"player_silent_kill"},
		cost = tweak_data.skilltree.costs.default
	},
	[2] = {
		upgrades = {"player_silent_kill"},
		cost = tweak_data.skilltree.costs.pro
	}
}
 -- Combat Engineer
tweak_data.skilltree.skills.tech_mid_1 = {
	["name_id"] = "menu_technician_mid_1",
	["desc_id"] = "menu_technician_mid_1_desc",
	["icon_xy"] = {4, 6},
	[1] = {
		upgrades = {
			"trip_mine_sensor_toggle",
			"trip_mine_sensor_highlight"
		},
		cost = tweak_data.skilltree.costs.default
	},
	[2] = {
		upgrades = {
			"trip_mine_marked_enemy_extra_damage"
		},
		cost = tweak_data.skilltree.costs.pro
	}
}
  -- Nerves of Steel
tweak_data.skilltree.skills.tech_right_1 = {
	["name_id"] = "menu_discipline",
	["desc_id"] = "menu_discipline_desc",
	["icon_xy"] = {6, 6},
	[1] = {
		upgrades = {
			"player_interacting_damage_multiplier"
		},
		cost = tweak_data.skilltree.costs.default
	},
	[2] = {
		upgrades = {
			"player_steelsight_when_downed"
		},
		cost = tweak_data.skilltree.costs.pro
	}
}
 -- Unknown
tweak_data.skilltree.skills.tech_left_2 = {
	["name_id"] = "menu_technician_left_2",
	["desc_id"] = "menu_technician_left_2_desc",
	["icon_xy"] = {0, 0},
	[1] = {
		upgrades = {"player_silent_kill"},
		cost = tweak_data.skilltree.costs.default
	},
	[2] = {
		upgrades = {"player_silent_kill"},
		cost = tweak_data.skilltree.costs.pro
	}
}
 -- Tactical Mines
tweak_data.skilltree.skills.tech_mid_2 = {
	["name_id"] = "menu_technician_mid_2",
	["desc_id"] = "menu_technician_mid_2_desc",
	["icon_xy"] = {1, 5},
	[1] = {
		upgrades = {
			"trip_mine_explosion_size_multiplier_1"
		},
		cost = tweak_data.skilltree.costs.default
	},
	[2] = {
		upgrades = {
			"trip_mine_explosion_size_multiplier_2"
		},
		cost = tweak_data.skilltree.costs.pro
	}
}
 -- Hardware Expert
tweak_data.skilltree.skills.tech_right_2 = {
	["name_id"] = "menu_technician_right_2",
	["desc_id"] = "menu_technician_right_2_desc",
	["icon_xy"] = {5, 5},
	[1] = {
		upgrades = {
			"player_drill_fix_interaction_speed_multiplier",
			"player_trip_mine_deploy_time_multiplier",
			"player_trip_mine_deploy_time_multiplier_2"
		},
		cost = tweak_data.skilltree.costs.default
	},
	[2] = {
		upgrades = {
			"player_drill_autorepair",
			"player_sentry_gun_deploy_time_multiplier"
		},
		cost = tweak_data.skilltree.costs.pro
	}
}
 -- Sentry Gun
tweak_data.skilltree.skills.tech_left_3 = {
	["name_id"] = "menu_technician_left_3",
	["desc_id"] = "menu_technician_left_3_desc",
	["icon_xy"] = {7, 5},
	[1] = {
		upgrades = {
			"sentry_gun",
			"sentry_gun_armor_multiplier",
			"sentry_gun_shield"
		},
		cost = tweak_data.skilltree.costs.default
	},
	[2] = {
		upgrades = {
			"sentry_gun_spread_multiplier",
			"sentry_gun_rot_speed_multiplier"
		},
		cost = tweak_data.skilltree.costs.pro
	}
}
 -- Jack of All Trades
tweak_data.skilltree.skills.tech_mid_3 = {
	["name_id"] = "menu_technician_mid_3",
	["desc_id"] = "menu_technician_mid_3_desc",
	["icon_xy"] = {7, 6},
	[1] = {
		upgrades = {"player_silent_kill"
			-- Unknown
			-- "player_level_interaction_timer_multiplier"
		},
		cost = tweak_data.skilltree.costs.default
	},
	[2] = {
		upgrades = {
			"player_carry_sentry_and_trip"
		},
		cost = tweak_data.skilltree.costs.pro
	}
}
 -- Drill Sawgent
tweak_data.skilltree.skills.tech_right_3 = {
	["name_id"] = "menu_drill_expert",
	["desc_id"] = "menu_drill_expert_desc",
	["icon_xy"] = {3, 6},
	[1] = {
		upgrades = {
			"player_drill_speed_multiplier1"
		},
		cost = tweak_data.skilltree.costs.default
	},
	[2] = {
		upgrades = {
			"player_drill_speed_multiplier2"
		},
		cost = tweak_data.skilltree.costs.pro
	}
}
 -- Sentry Combat Upgrade
tweak_data.skilltree.skills.tech_left_4 = {
	["name_id"] = "menu_technician_left_4",
	["desc_id"] = "menu_technician_left_4_desc",
	["icon_xy"] = {5, 6},
	["prerequisites"] = {"tech_left_3"},
	[1] = {
		upgrades = {
			"sentry_gun_extra_ammo_multiplier_1"
		},
		cost = tweak_data.skilltree.costs.hightier
	},
	[2] = {
		upgrades = {
			"sentry_gun_can_reload"
			-- "sentry_gun_extra_ammo_multiplier_2"
		},
		cost = tweak_data.skilltree.costs.hightierpro
	}
}

 -- Shaped Charge
tweak_data.skilltree.skills.tech_mid_4 = {
	["name_id"] = "menu_technician_mid_4",
	["desc_id"] = "menu_technician_mid_4_desc",
	["icon_xy"] = {0, 7},
	[1] = {
		upgrades = {
			"player_trip_mine_shaped_charge"
		},
		cost = tweak_data.skilltree.costs.hightier
	},
	[2] = {
		upgrades = {
			"trip_mine_quantity_increase_1",
			"trip_mine_quantity_increase_3",
			"trip_mine_quantity_increase_4"
		},
		cost = tweak_data.skilltree.costs.hightierpro
	}
}
 -- Silent Drilling
tweak_data.skilltree.skills.tech_right_4 = {
	["name_id"] = "menu_silent_drilling",
	["desc_id"] = "menu_silent_drilling_desc",
	["icon_xy"] = {2, 6},
	[1] = {
		upgrades = {
			"player_drill_alert"
		},
		cost = tweak_data.skilltree.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_silent_drill"
		},
		cost = tweak_data.skilltree.costs.hightierpro
	}
}
 -- Sentry Tower Defense
tweak_data.skilltree.skills.tech_left_5 = {
	["name_id"] = "menu_sentry_gun_2x",
	["desc_id"] = "menu_sentry_gun_2x_desc",
	["icon_xy"] = {7, 6},
	["prerequisites"] = {"tech_left_4"},
	[1] = {
		upgrades = {
			"sentry_gun_quantity_increase"
		},
		cost = tweak_data.skilltree.costs.hightier
	},
	[2] = {
		upgrades = {
			"sentry_gun_damage_multiplier"
		},
		cost = tweak_data.skilltree.costs.hightierpro
	}
}

tweak_data.upgrades.values.weapon.mag_increase = {1.22,1.42}
tweak_data.upgrades.definitions.weapon_mag_increase_1 = {
	category = "feature",
	name_id = "menu_weapon_mag_increase_1",
	upgrade = {
		category = "weapon",
		upgrade = "mag_increase",
		value = 1
	}
}
tweak_data.upgrades.definitions.weapon_mag_increase_2 = {
	category = "feature",
	name_id = "menu_weapon_mag_increase_2",
	upgrade = {
		category = "weapon",
		upgrade = "mag_increase",
		value = 2
	}
}

 -- Mag Plus
tweak_data.skilltree.skills.tech_mid_5 = {
	["name_id"] = "menu_technician_mid_5",
	["desc_id"] = "menu_technician_mid_5_desc",
	["icon_xy"] = {2, 0},
	[1] = {
		upgrades = {
			"weapon_mag_increase_1"
		},
		cost = tweak_data.skilltree.costs.hightier
	},
	[2] = {
		upgrades = {
			"weapon_mag_increase_2"
		},
		cost = tweak_data.skilltree.costs.hightierpro
	}
}
 -- Shockproof
tweak_data.skilltree.skills.tech_right_5 = {
	["name_id"] = "menu_insulation",
	["desc_id"] = "menu_insulation_desc",
	["icon_xy"] = {3, 5},
	[1] = {
		upgrades = {
			"player_taser_malfunction"
		},
		cost = tweak_data.skilltree.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_taser_self_shock"
		},
		cost = tweak_data.skilltree.costs.hightierpro
	}
}
 -- Unknown
tweak_data.skilltree.skills.tech_left_6 = {
	["name_id"] = "menu_technician_left_6",
	["desc_id"] = "menu_technician_left_6_desc",
	["icon_xy"] = {0, 0},
	[1] = {
		upgrades = {"player_silent_kill"},
		cost = tweak_data.skilltree.costs.hightier
	},
	[2] = {
		upgrades = {"player_silent_kill"},
		cost = tweak_data.skilltree.costs.hightierpro
	}
}
 -- Unknown
tweak_data.skilltree.skills.tech_mid_6 = {
	["name_id"] = "menu_technician_mid_6",
	["desc_id"] = "menu_technician_mid_6_desc",
	["icon_xy"] = {0, 0},
	[1] = {
		upgrades = {"player_silent_kill"},
		cost = tweak_data.skilltree.costs.hightier
	},
	[2] = {
		upgrades = {"player_silent_kill"},
		cost = tweak_data.skilltree.costs.hightierpro
	}
}
 -- Bulletproof
tweak_data.skilltree.skills.tech_right_6 = {
	["name_id"] = "menu_iron_man",
	["desc_id"] = "menu_iron_man_desc",
	["icon_xy"] = {6, 4},
	[1] = {
		upgrades = {
			"player_armor_multiplier"
		},
		cost = tweak_data.skilltree.costs.hightier
	},
	[2] = {
		upgrades = {
			"team_armor_regen_time_multiplier"
		},
		cost = tweak_data.skilltree.costs.hightierpro
	}
}

tweak_data.skilltree.trees[3] = {
	name_id = "st_menu_technician",
	skill = "tech_rework",
	background_texture = "guis/textures/pd2/skilltree/bg_technician",
	tiers = {}
}
tweak_data.skilltree.trees[3].tiers[1] = {
	"tech_left_1",
	"tech_mid_1",
	"tech_right_1"
}
tweak_data.skilltree.trees[3].tiers[2] = {
	"tech_left_2",
	"tech_mid_2",
	"tech_right_2"
}
tweak_data.skilltree.trees[3].tiers[3] = {
	"tech_left_3",
	"tech_mid_3",
	"tech_right_3"
}
tweak_data.skilltree.trees[3].tiers[4] = {
	"tech_left_4",
	"tech_mid_4",
	"tech_right_4"
}
tweak_data.skilltree.trees[3].tiers[5] = {
	"tech_left_5",
	"tech_mid_5",
	"tech_right_5"
}
tweak_data.skilltree.trees[3].tiers[6] = {
	"tech_left_6",
	"tech_mid_6",
	"tech_right_6"
}
fired = false
if not fired then
	managers.skilltree:_setup_skill_switches()
--	managers.player:_internal_load()
	fired = true
end