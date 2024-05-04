return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			image = 'burger_chicken.png',
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['sprunk'] = {
		label = 'Sprunk',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with a sprunk'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
		client = {
			image = 'card_id.png'
		}
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Fleeca Card',
		stack = false,
		weight = 10,
		client = {
			image = 'card_bank.png'
		}
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	["alive_chicken"] = {
		label = "Living chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_BALL"] = {
		label = "AMMO_BALL",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_BIRD_CRAP"] = {
		label = "AMMO_BIRD_CRAP",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_BZGAS"] = {
		label = "AMMO_BZGAS",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_ENEMY_LASER"] = {
		label = "AMMO_ENEMY_LASER",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_FIREEXTINGUISHER"] = {
		label = "AMMO_FIREEXTINGUISHER",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_FIREWORK"] = {
		label = "AMMO_FIREWORK",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_FLARE"] = {
		label = "AMMO_FLARE",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_FLAREGUN"] = {
		label = "AMMO_FLAREGUN",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_GRENADE"] = {
		label = "AMMO_GRENADE",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_GRENADELAUNCHER"] = {
		label = "AMMO_GRENADELAUNCHER",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_GRENADELAUNCHER_SMOKE"] = {
		label = "AMMO_GRENADELAUNCHER_SMOKE",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_HOMINGLAUNCHER"] = {
		label = "AMMO_HOMINGLAUNCHER",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_MG"] = {
		label = "AMMO_MG",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_MG_ARMORPIERCING"] = {
		label = "AMMO_MG_ARMORPIERCING",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_MG_FMJ"] = {
		label = "AMMO_MG_FMJ",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_MG_INCENDIARY"] = {
		label = "AMMO_MG_INCENDIARY",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_MG_TRACER"] = {
		label = "AMMO_MG_TRACER",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_MINIGUN"] = {
		label = "AMMO_MINIGUN",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_MOLOTOV"] = {
		label = "AMMO_MOLOTOV",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_PETROLCAN"] = {
		label = "AMMO_PETROLCAN",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_PIPEBOMB"] = {
		label = "AMMO_PIPEBOMB",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_PISTOL"] = {
		label = "AMMO_PISTOL",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_PISTOL_FMJ"] = {
		label = "AMMO_PISTOL_FMJ",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_PISTOL_HOLLOWPOINT"] = {
		label = "AMMO_PISTOL_HOLLOWPOINT",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_PISTOL_INCENDIARY"] = {
		label = "AMMO_PISTOL_INCENDIARY",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_PISTOL_POLICE"] = {
		label = "AMMO_PISTOL_POLICE",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_PISTOL_TRACER"] = {
		label = "AMMO_PISTOL_TRACER",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_PLANE_ROCKET"] = {
		label = "AMMO_PLANE_ROCKET",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_PLAYER_LASER"] = {
		label = "AMMO_PLAYER_LASER",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_PROXMINE"] = {
		label = "AMMO_PROXMINE",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_RAILGUN"] = {
		label = "AMMO_RAILGUN",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_RIFLE"] = {
		label = "AMMO_RIFLE",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_RIFLE_ARMORPIERCING"] = {
		label = "AMMO_RIFLE_ARMORPIERCING",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_RIFLE_FMJ"] = {
		label = "AMMO_RIFLE_FMJ",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_RIFLE_INCENDIARY"] = {
		label = "AMMO_RIFLE_INCENDIARY",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_RIFLE_POLICE"] = {
		label = "AMMO_RIFLE_POLICE",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_RIFLE_TRACER"] = {
		label = "AMMO_RIFLE_TRACER",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_RPG"] = {
		label = "AMMO_RPG",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SHOTGUN"] = {
		label = "AMMO_SHOTGUN",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SHOTGUN_ARMORPIERCING"] = {
		label = "AMMO_SHOTGUN_ARMORPIERCING",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SHOTGUN_EXPLOSIVE"] = {
		label = "AMMO_SHOTGUN_EXPLOSIVE",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SHOTGUN_HOLLOWPOINT"] = {
		label = "AMMO_SHOTGUN_HOLLOWPOINT",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SHOTGUN_INCENDIARY"] = {
		label = "AMMO_SHOTGUN_INCENDIARY",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SHOTGUN_POLICE"] = {
		label = "AMMO_SHOTGUN_POLICE",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SMG"] = {
		label = "AMMO_SMG",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SMG_FMJ"] = {
		label = "AMMO_SMG_FMJ",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SMG_HOLLOWPOINT"] = {
		label = "AMMO_SMG_HOLLOWPOINT",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SMG_INCENDIARY"] = {
		label = "AMMO_SMG_INCENDIARY",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SMG_TRACER"] = {
		label = "AMMO_SMG_TRACER",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SMOKEGRENADE"] = {
		label = "AMMO_SMOKEGRENADE",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SNIPER"] = {
		label = "AMMO_SNIPER",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SNIPER_ARMORPIERCING"] = {
		label = "AMMO_SNIPER_ARMORPIERCING",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SNIPER_EXPLOSIVE"] = {
		label = "AMMO_SNIPER_EXPLOSIVE",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SNIPER_FMJ"] = {
		label = "AMMO_SNIPER_FMJ",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SNIPER_INCENDIARY"] = {
		label = "AMMO_SNIPER_INCENDIARY",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SNIPER_REMOTE"] = {
		label = "AMMO_SNIPER_REMOTE",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SNIPER_TRACER"] = {
		label = "AMMO_SNIPER_TRACER",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SNOWBALL"] = {
		label = "AMMO_SNOWBALL",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_SPACE_ROCKET"] = {
		label = "AMMO_SPACE_ROCKET",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_STICKYBOMB"] = {
		label = "AMMO_STICKYBOMB",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_STINGER"] = {
		label = "AMMO_STINGER",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_STUNGUN"] = {
		label = "AMMO_STUNGUN",
		weight = 1,
		stack = true,
		close = true,
	},

	["AMMO_TANK"] = {
		label = "AMMO_TANK",
		weight = 1,
		stack = true,
		close = true,
	},

	["blowpipe"] = {
		label = "Blowtorch",
		weight = 2,
		stack = true,
		close = true,
	},

	["bread"] = {
		label = "Bread",
		weight = 1,
		stack = true,
		close = true,
	},

	["cannabis"] = {
		label = "Cannabis",
		weight = 3,
		stack = true,
		close = true,
	},

	["carokit"] = {
		label = "Body Kit",
		weight = 3,
		stack = true,
		close = true,
	},

	["carotool"] = {
		label = "Tools",
		weight = 2,
		stack = true,
		close = true,
	},

	["clothe"] = {
		label = "Cloth",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ADVANCEDRIFLE_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ADVANCEDRIFLE_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE"] = {
		label = "Gilded Gun Metal Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_APPISTOL_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_APPISTOL_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_APPISTOL_VARMOD_LUXE"] = {
		label = "Gilded Gun Metal Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_APPISTOL_VARMOD_SECURITY"] = {
		label = "Record A Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_CLIP_03"] = {
		label = "Drum Magazine",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_MK2_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_MK2_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING"] = {
		label = "Armor Piercing Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ"] = {
		label = "Full Metal Jacket Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY"] = {
		label = "Incendiary Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER"] = {
		label = "Tracer Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_NEWYEAR"] = {
		label = "AK47 TẾT",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_NOEL"] = {
		label = "AK47 NOEL",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_S1"] = {
		label = "ASSAULTRIFLE S1",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_S10"] = {
		label = "ASSAULTRIFLE S10",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_S11"] = {
		label = "ASSAULTRIFLE S11",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_S12"] = {
		label = "ASSAULTRIFLE S12",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_S2"] = {
		label = "ASSAULTRIFLE S2",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_S3"] = {
		label = "ASSAULTRIFLE S3",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_S4"] = {
		label = "ASSAULTRIFLE S4",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_S5"] = {
		label = "ASSAULTRIFLE S5",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_S6"] = {
		label = "ASSAULTRIFLE S6",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_S7"] = {
		label = "ASSAULTRIFLE S7",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_S8"] = {
		label = "ASSAULTRIFLE S8",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_S9"] = {
		label = "ASSAULTRIFLE S9",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTRIFLE_VARMOD_LUXE"] = {
		label = "Yusuf Amir Luxury Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTSHOTGUN_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTSHOTGUN_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTSMG_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTSMG_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER"] = {
		label = "Yusuf Amir Luxury Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_AR_AFGRIP"] = {
		label = "Grip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_AR_AFGRIP_02"] = {
		label = "Grip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_AR_BARREL_01"] = {
		label = "Default Barrel",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_AR_BARREL_02"] = {
		label = "Heavy Barrel",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_AR_FLSH"] = {
		label = "Flashlight",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_AR_FLSH_REH"] = {
		label = "Flashlight",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_AR_SUPP"] = {
		label = "Suppressor",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_AR_SUPP_02"] = {
		label = "Suppressor",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_BP_BARREL_01"] = {
		label = "Default Barrel",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_BP_BARREL_02"] = {
		label = "Heavy Barrel",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_CR_BARREL_01"] = {
		label = "Default Barrel",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_CR_BARREL_02"] = {
		label = "Heavy Barrel",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_MG_BARREL_01"] = {
		label = "Default Barrel",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_MG_BARREL_02"] = {
		label = "Heavy Barrel",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_MRFL_BARREL_01"] = {
		label = "Default Barrel",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_MRFL_BARREL_02"] = {
		label = "Heavy Barrel",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_MUZZLE_01"] = {
		label = "Flat Muzzle Brake",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_MUZZLE_02"] = {
		label = "Tactical Muzzle Brake",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_MUZZLE_03"] = {
		label = "Fat-End Muzzle Brake",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_MUZZLE_04"] = {
		label = "Precision Muzzle Brake",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_MUZZLE_05"] = {
		label = "Heavy Duty Muzzle Brake",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_MUZZLE_06"] = {
		label = "Slanted Muzzle Brake",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_MUZZLE_07"] = {
		label = "Split-End Muzzle Brake",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_MUZZLE_08"] = {
		label = "Squared Muzzle Brake",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_MUZZLE_09"] = {
		label = "Bell-End Muzzle Brake",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_PI_COMP"] = {
		label = "Compensator",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_PI_COMP_02"] = {
		label = "Compensator",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_PI_COMP_03"] = {
		label = "Compensator",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_PI_FLSH"] = {
		label = "Flashlight",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_PI_FLSH_02"] = {
		label = "Flashlight",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_PI_FLSH_03"] = {
		label = "Flashlight",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_PI_RAIL"] = {
		label = "Mounted Scope",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_PI_RAIL_02"] = {
		label = "Mounted Scope",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_PI_SUPP"] = {
		label = "Suppressor",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_PI_SUPP_02"] = {
		label = "Suppressor",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_RAILCOVER_01"] = {
		label = "",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SB_BARREL_01"] = {
		label = "Default Barrel",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SB_BARREL_02"] = {
		label = "Heavy Barrel",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SCOPE_LARGE"] = {
		label = "Scope",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM"] = {
		label = "Scope",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2"] = {
		label = "Zoom Scope",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SCOPE_LARGE_MK2"] = {
		label = "Zoom Scope",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SCOPE_MACRO"] = {
		label = "Scope",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SCOPE_MACRO_02"] = {
		label = "Scope",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SCOPE_MACRO_02_MK2"] = {
		label = "Small Scope",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2"] = {
		label = "Small Scope",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SCOPE_MACRO_MK2"] = {
		label = "Small Scope",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SCOPE_MAX"] = {
		label = "Advanced Scope",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SCOPE_MEDIUM"] = {
		label = "Scope",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SCOPE_MEDIUM_MK2"] = {
		label = "Large Scope",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SCOPE_NV"] = {
		label = "Night Vision Scope",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SCOPE_SMALL"] = {
		label = "Scope",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SCOPE_SMALL_02"] = {
		label = "Scope",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SCOPE_SMALL_MK2"] = {
		label = "Medium Scope",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SCOPE_SMALL_SMG_MK2"] = {
		label = "Medium Scope",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SCOPE_THERMAL"] = {
		label = "Thermal Scope",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SC_BARREL_01"] = {
		label = "Default Barrel",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SC_BARREL_02"] = {
		label = "Heavy Barrel",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SIGHTS"] = {
		label = "Holographic Sight",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SIGHTS_SMG"] = {
		label = "Holographic Sight",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SR_BARREL_01"] = {
		label = "Default Barrel",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SR_BARREL_02"] = {
		label = "Heavy Barrel",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SR_SUPP"] = {
		label = "Suppressor",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AT_SR_SUPP_03"] = {
		label = "Suppressor",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_AUTOSHOTGUN_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BAT_VARMOD_XM3"] = {
		label = "Blagueurs",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BAT_VARMOD_XM3_01"] = {
		label = "Spatter",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BAT_VARMOD_XM3_02"] = {
		label = "Bullet Holes",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BAT_VARMOD_XM3_03"] = {
		label = "Burger Shot",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BAT_VARMOD_XM3_04"] = {
		label = "Cluckin' Bell",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BAT_VARMOD_XM3_05"] = {
		label = "Fatal Incursion",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BAT_VARMOD_XM3_06"] = {
		label = "Lucha Libre",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BAT_VARMOD_XM3_07"] = {
		label = "Trippy",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BAT_VARMOD_XM3_08"] = {
		label = "Tie-Dye",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BAT_VARMOD_XM3_09"] = {
		label = "Wall",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BLASTX"] = {
		label = "PHANTOM BLASTX",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BUCKY_CLIP_01"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BUCKY_LOGITECH"] = {
		label = "BUCKY LOGITECH",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BUCKY_SPIKE"] = {
		label = "BUCKY SPIKE",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BULLPUPRIFLE_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BULLPUPRIFLE_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BULLPUPRIFLE_MK2_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BULLPUPRIFLE_MK2_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING"] = {
		label = "Armor Piercing Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ"] = {
		label = "Full Metal Jacket Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY"] = {
		label = "Incendiary Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER"] = {
		label = "Tracer Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BULLPUPRIFLE_VARMOD_LOW"] = {
		label = "Gilded Gun Metal Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_BULLPUPSHOTGUN_CLIP_01"] = {
		label = "",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_CLIP_03"] = {
		label = "Box Magazine",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_MK2_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_MK2_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING"] = {
		label = "Armor Piercing Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ"] = {
		label = "Full Metal Jacket Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY"] = {
		label = "Incendiary Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER"] = {
		label = "Tracer Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_NEWYEAR"] = {
		label = "M4 TẾT",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_NOEL"] = {
		label = "M4 NOEL",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_S1"] = {
		label = "CARBINERIFLE S1",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_S10"] = {
		label = "CARBINERIFLE S10",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_S2"] = {
		label = "CARBINERIFLE S2",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_S3"] = {
		label = "CARBINERIFLE S3",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_S4"] = {
		label = "CARBINERIFLE S4",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_S5"] = {
		label = "CARBINERIFLE S5",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_S6"] = {
		label = "CARBINERIFLE S6",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_S7"] = {
		label = "CARBINERIFLE S7",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_S8"] = {
		label = "CARBINERIFLE S8",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_S9"] = {
		label = "CARBINERIFLE S9",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CARBINERIFLE_VARMOD_LUXE"] = {
		label = "Yusuf Amir Luxury Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CERAMICPISTOL_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CERAMICPISTOL_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_CERAMICPISTOL_SUPP"] = {
		label = "Suppressor",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_COMBATMG_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_COMBATMG_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_COMBATMG_MK2_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_COMBATMG_MK2_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING"] = {
		label = "Armor Piercing Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_COMBATMG_MK2_CLIP_FMJ"] = {
		label = "Full Metal Jacket Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY"] = {
		label = "Incendiary Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_COMBATMG_MK2_CLIP_TRACER"] = {
		label = "Tracer Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_COMBATMG_VARMOD_LOWRIDER"] = {
		label = "Etched Gun Metal Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_COMBATPDW_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_COMBATPDW_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_COMBATPDW_CLIP_03"] = {
		label = "Drum Magazine",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_COMBATPISTOL_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_COMBATPISTOL_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER"] = {
		label = "Yusuf Amir Luxury Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_COMBATSHOTGUN_CLIP_01"] = {
		label = "Default Shells",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_COMPACTLAUNCHER_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_COMPACTRIFLE_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_COMPACTRIFLE_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_COMPACTRIFLE_CLIP_03"] = {
		label = "Drum Magazine",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_DBSHOTGUN_CLIP_01"] = {
		label = "",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_DEEPSEA"] = {
		label = "PHANTOM DEEPSEA",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_DOUBLEACTION_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_EMPLAUNCHER_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_FIREWORK_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_FLAREGUN_CLIP_01"] = {
		label = "",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_FLASHLIGHT_LIGHT"] = {
		label = "Flashlight",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_GADGETPISTOL_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_GRENADELAUNCHER_CLIP_01"] = {
		label = "",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_GUSENBERG_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_GUSENBERG_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_HEAVYPISTOL_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_HEAVYPISTOL_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_HEAVYPISTOL_VARMOD_LUXE"] = {
		label = "Etched Wood Grip Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_HEAVYRIFLE_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_HEAVYRIFLE_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_HEAVYRIFLE_SIGHT_01"] = {
		label = "Iron Sights",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_HEAVYSHOTGUN_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_HEAVYSHOTGUN_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_HEAVYSHOTGUN_CLIP_03"] = {
		label = "Drum Magazine",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_HEAVYSNIPER_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_HEAVYSNIPER_MK2_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_HEAVYSNIPER_MK2_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING"] = {
		label = "Armor Piercing Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE"] = {
		label = "Explosive Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ"] = {
		label = "Full Metal Jacket Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY"] = {
		label = "Incendiary Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_HOMINGLAUNCHER_CLIP_01"] = {
		label = "",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_KNIFE_VARMOD_XM3"] = {
		label = "Eyes",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_KNIFE_VARMOD_XM3_01"] = {
		label = "Spatter",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_KNIFE_VARMOD_XM3_02"] = {
		label = "Flames",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_KNIFE_VARMOD_XM3_03"] = {
		label = "Lightning",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_KNIFE_VARMOD_XM3_04"] = {
		label = "Pills",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_KNIFE_VARMOD_XM3_05"] = {
		label = "Snakeskin",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_KNIFE_VARMOD_XM3_06"] = {
		label = "Lucha Libre",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_KNIFE_VARMOD_XM3_07"] = {
		label = "Trippy",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_KNIFE_VARMOD_XM3_08"] = {
		label = "Tequilya",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_KNIFE_VARMOD_XM3_09"] = {
		label = "Orang-O-Tang",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_KNUCKLE_VARMOD_BALLAS"] = {
		label = "The Ballas",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_KNUCKLE_VARMOD_BASE"] = {
		label = "Base Model",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_KNUCKLE_VARMOD_DIAMOND"] = {
		label = "The Rock",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_KNUCKLE_VARMOD_DOLLAR"] = {
		label = "The Hustler",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_KNUCKLE_VARMOD_HATE"] = {
		label = "The Hater",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_KNUCKLE_VARMOD_KING"] = {
		label = "The King",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_KNUCKLE_VARMOD_LOVE"] = {
		label = "The Lover",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_KNUCKLE_VARMOD_PIMP"] = {
		label = "The Pimp",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_KNUCKLE_VARMOD_PLAYER"] = {
		label = "The Player",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_KNUCKLE_VARMOD_VAGOS"] = {
		label = "The Vagos",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MACHINEPISTOL_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MACHINEPISTOL_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MACHINEPISTOL_CLIP_03"] = {
		label = "Drum Magazine",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MARKSMANPISTOL_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MARKSMANRIFLE_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MARKSMANRIFLE_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MARKSMANRIFLE_MK2_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MARKSMANRIFLE_MK2_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING"] = {
		label = "Armor Piercing Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ"] = {
		label = "Full Metal Jacket Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY"] = {
		label = "Incendiary Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER"] = {
		label = "Tracer Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MARKSMANRIFLE_VARMOD_LUXE"] = {
		label = "Yusuf Amir Luxury Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MG_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MG_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MG_VARMOD_LOWRIDER"] = {
		label = "Yusuf Amir Luxury Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MICROSMG_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MICROSMG_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MICROSMG_VARMOD_LUXE"] = {
		label = "Yusuf Amir Luxury Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MICROSMG_VARMOD_SECURITY"] = {
		label = "Organics Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MICROSMG_VARMOD_XM3"] = {
		label = "Dildodude Camo",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MILITARYRIFLE_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MILITARYRIFLE_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MILITARYRIFLE_SIGHT_01"] = {
		label = "Iron Sights",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MINIGUN_CLIP_01"] = {
		label = "",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MINISMG_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MINISMG_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_MUSKET_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_NAVYREVOLVER_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PHANTOM_CLIP_01"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PISTOL50_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PISTOL50_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PISTOL50_VARMOD_LUXE"] = {
		label = "Platinum Pearl Deluxe Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PISTOLXM3_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PISTOLXM3_SUPP"] = {
		label = "Suppressor",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PISTOL_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PISTOL_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PISTOL_MK2_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PISTOL_MK2_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PISTOL_MK2_CLIP_FMJ"] = {
		label = "Full Metal Jacket Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT"] = {
		label = "Hollow Point Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PISTOL_MK2_CLIP_INCENDIARY"] = {
		label = "Incendiary Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PISTOL_MK2_CLIP_TRACER"] = {
		label = "Tracer Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PISTOL_MK2_VARMOD_XM3"] = {
		label = "Season's Greetings",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PISTOL_MK2_VARMOD_XM3_SLIDE"] = {
		label = "Season's Greetings",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PISTOL_VARMOD_LUXE"] = {
		label = "Yusuf Amir Luxury Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PRECISIONRIFLE_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PUMPSHOTGUN_CLIP_01"] = {
		label = "",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PUMPSHOTGUN_MK2_CLIP_01"] = {
		label = "Default Shells",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING"] = {
		label = "Steel Buckshot Shells",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE"] = {
		label = "Explosive Slugs",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT"] = {
		label = "Flechette Shells",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY"] = {
		label = "Dragon's Breath Shells",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER"] = {
		label = "Yusuf Amir Luxury Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PUMPSHOTGUN_VARMOD_SECURITY"] = {
		label = "Bone Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_PUMPSHOTGUN_VARMOD_XM3"] = {
		label = "Dildodude Camo",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_RAILGUNXM3_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_RAILGUN_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_RAYPISTOL_VARMOD_XMAS18"] = {
		label = "Festive tint",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_REVOLVER_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_REVOLVER_MK2_CLIP_01"] = {
		label = "Default Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_REVOLVER_MK2_CLIP_FMJ"] = {
		label = "Full Metal Jacket Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT"] = {
		label = "Hollow Point Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY"] = {
		label = "Incendiary Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_REVOLVER_MK2_CLIP_TRACER"] = {
		label = "Tracer Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_REVOLVER_VARMOD_BOSS"] = {
		label = "VIP Variant",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_REVOLVER_VARMOD_GOON"] = {
		label = "Bodyguard Variant",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_RPG_CLIP_01"] = {
		label = "",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SAWNOFFSHOTGUN_CLIP_01"] = {
		label = "",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE"] = {
		label = "Gilded Gun Metal Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SMG_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SMG_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SMG_CLIP_03"] = {
		label = "Drum Magazine",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SMG_MK2_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SMG_MK2_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SMG_MK2_CLIP_FMJ"] = {
		label = "Full Metal Jacket Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT"] = {
		label = "Hollow Point Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SMG_MK2_CLIP_INCENDIARY"] = {
		label = "Incendiary Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SMG_MK2_CLIP_TRACER"] = {
		label = "Tracer Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SMG_VARMOD_LUXE"] = {
		label = "Yusuf Amir Luxury Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SNIPERRIFLE_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SNIPERRIFLE_VARMOD_LUXE"] = {
		label = "Etched Wood Grip Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SNSPISTOL_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SNSPISTOL_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SNSPISTOL_MK2_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SNSPISTOL_MK2_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SNSPISTOL_MK2_CLIP_FMJ"] = {
		label = "Full Metal Jacket Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT"] = {
		label = "Hollow Point Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY"] = {
		label = "Incendiary Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SNSPISTOL_MK2_CLIP_TRACER"] = {
		label = "Tracer Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SNSPISTOL_VARMOD_LOWRIDER"] = {
		label = "Etched Wood Grip Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SPECIALCARBINE_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SPECIALCARBINE_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SPECIALCARBINE_CLIP_03"] = {
		label = "Drum Magazine",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SPECIALCARBINE_MK2_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SPECIALCARBINE_MK2_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING"] = {
		label = "Armor Piercing Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ"] = {
		label = "Full Metal Jacket Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY"] = {
		label = "Incendiary Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER"] = {
		label = "Tracer Rounds",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SPECIALCARBINE_NEWYEAR"] = {
		label = "G36C TẾT",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SPECIALCARBINE_NOEL"] = {
		label = "G36C NOEL",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SPECIALCARBINE_PTP"] = {
		label = "G36C PTP",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SPECIALCARBINE_QBL"] = {
		label = "G36C QBL",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SPECIALCARBINE_S1"] = {
		label = "G36C S1",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SPECIALCARBINE_S2"] = {
		label = "G36C S2",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SPECIALCARBINE_S3"] = {
		label = "G36C S3",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SPECIALCARBINE_SMK"] = {
		label = "G36C SMK",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER"] = {
		label = "Etched Gun Metal Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SPECIALCARBINE_VRIK"] = {
		label = "G36C VRIK",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SWITCHBLADE_VARMOD_BASE"] = {
		label = "Default Handle",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SWITCHBLADE_VARMOD_VAR1"] = {
		label = "VIP Variant",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_SWITCHBLADE_VARMOD_VAR2"] = {
		label = "Bodyguard Variant",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_TACTICALRIFLE_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_TACTICALRIFLE_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_VANDALNOR_HLW"] = {
		label = "VANDAL HLW",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_VANDALNOR_ION"] = {
		label = "VANDAL ION",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_VANDALNOR_ONI"] = {
		label = "VANDAL ONI",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_VANDALNOR_PT"] = {
		label = "VANDAL PT",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_VANDALNOR_TREE"] = {
		label = "VANDAL PT",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_VANDAL_CLIP_01"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_VINTAGEPISTOL_CLIP_01"] = {
		label = "Default Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["COMPONENT_VINTAGEPISTOL_CLIP_02"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["copper"] = {
		label = "Copper",
		weight = 1,
		stack = true,
		close = true,
	},

	["cutted_wood"] = {
		label = "Cut wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["diamond"] = {
		label = "Diamond",
		weight = 1,
		stack = true,
		close = true,
	},

	["essence"] = {
		label = "Gas",
		weight = 1,
		stack = true,
		close = true,
	},

	["fabric"] = {
		label = "Fabric",
		weight = 1,
		stack = true,
		close = true,
	},

	["fish"] = {
		label = "Fish",
		weight = 1,
		stack = true,
		close = true,
	},

	["fixkit"] = {
		label = "Repair Kit",
		weight = 3,
		stack = true,
		close = true,
	},

	["fixtool"] = {
		label = "Repair Tools",
		weight = 2,
		stack = true,
		close = true,
	},

	["fuelcan"] = {
		label = "Can xăng",
		weight = 1,
		stack = true,
		close = true,
	},

	["gazbottle"] = {
		label = "Gas Bottle",
		weight = 2,
		stack = true,
		close = true,
	},

	["gem_accurate_1"] = {
		label = "Đá chính xác lv1",
		weight = 1,
		stack = true,
		close = true,
	},

	["gem_accurate_2"] = {
		label = "Đá chính xác lv2",
		weight = 1,
		stack = true,
		close = true,
	},

	["gem_accurate_3"] = {
		label = "Đá chính xác lv3",
		weight = 1,
		stack = true,
		close = true,
	},

	["gem_critical_1"] = {
		label = "Đá chí mạng lv1",
		weight = 1,
		stack = true,
		close = true,
	},

	["gem_critical_2"] = {
		label = "Đá chí mạng lv2",
		weight = 1,
		stack = true,
		close = true,
	},

	["gem_critical_3"] = {
		label = "Đá chí mạng lv3",
		weight = 1,
		stack = true,
		close = true,
	},

	["gem_damage_1"] = {
		label = "Đá sát thương lv1",
		weight = 1,
		stack = true,
		close = true,
	},

	["gem_damage_2"] = {
		label = "Đá sát thương lv2",
		weight = 1,
		stack = true,
		close = true,
	},

	["gem_damage_3"] = {
		label = "Đá sát thương lv3",
		weight = 1,
		stack = true,
		close = true,
	},

	["gold"] = {
		label = "Gold",
		weight = 1,
		stack = true,
		close = true,
	},

	["iron"] = {
		label = "Iron",
		weight = 1,
		stack = true,
		close = true,
	},

	["marijuana"] = {
		label = "Marijuana",
		weight = 2,
		stack = true,
		close = true,
	},

	["medikit"] = {
		label = "Medikit",
		weight = 2,
		stack = true,
		close = true,
	},

	["packaged_chicken"] = {
		label = "Chicken fillet",
		weight = 1,
		stack = true,
		close = true,
	},

	["packaged_plank"] = {
		label = "Packaged wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol"] = {
		label = "Oil",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol_raffin"] = {
		label = "Processed oil",
		weight = 1,
		stack = true,
		close = true,
	},

	["slaughtered_chicken"] = {
		label = "Slaughtered chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["spin_ticket_1"] = {
		label = "spin_ticket_1",
		weight = 1,
		stack = true,
		close = true,
	},

	["spin_ticket_2"] = {
		label = "spin_ticket_2",
		weight = 1,
		stack = true,
		close = true,
	},

	["stone"] = {
		label = "Stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["washed_stone"] = {
		label = "Washed stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["wood"] = {
		label = "Wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["wool"] = {
		label = "Wool",
		weight = 1,
		stack = true,
		close = true,
	},

	["spin_box_ticket_1"] = {
		label = "spin_box_ticket_1",
		weight = 1,
		stack = true,
		close = true,
	},

	["spin_box_ticket_2"] = {
		label = "spin_box_ticket_2",
		weight = 1,
		stack = true,
		close = true,
	},
}