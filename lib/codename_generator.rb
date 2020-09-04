module CodenameGenerator
	ATTRIBUTES = [
		"desert", "tundra", "mountain", "space", "field", "urban", "hidden",
		"covert", "uncanny", "scheming", "decisive", "untouchable", "stalking",
		"rowdy", "dangerous", "explosive", "threatening", "warring", "deadly",
		"killer", "insane", "wild", "bad", "unnecessary", "unknown", "unexpected",
		"waning", "amber", "bone", "coral", "ivory", "jet", "nacre", "pearl",
		"obsidian", "glass", "agate", "beryl", "diamond", "opal", "ruby", "onyx",
		"sapphire", "emerald", "jade", "red", "orange", "yellow", "green", "blue",
		"violet", "draconic", "wireless", "spinning", "falling", "orbiting", "hunting",
		"chasing", "searching", "revealing", "flying", "destroyed", "inconceivable",
		"tarnished"
	]

	OBJECTS = [
		"panther", "wildcat", "tiger", "lion", "cheetah", "cougar", "leopard",
		"viper", "cottonmouth", "python", "boa", "sidewinder", "cobra", "grizzly",
		"jackal", "falcon", "wildebeest", "gazelle", "zebra", "elk", "moose", "deer",
		"stag", "pony", "koala", "sloth", "horse", "stallion", "foal", "colt", "mare",
		"yearling", "filly", "gelding", "mermaid", "unicorn", "fairy", "troll", "yeti",
		"pegasus", "griffin", "dragon", "nomad", "wizard", "cleric", "pilot",
		"captain", "commander", "general", "major", "admiral", "chef", "inspector",
		"mainframe", "device", "motherboard", "network", "transistor", "packet",
		"robot", "android", "cyborg", "display", "battery", "memory", "disk",
		"cartridge", "tape", "camera", "projector", "octopus", "lobster", "crab",
		"barnacle", "hammerhead", "orca", "piranha", "storm", "thunder", "lightning",
		"rain", "hail", "sun", "drought", "snow", "drizzle", "piano", "keyboard",
		"guitar", "trumpet", "trombone", "flute", "cornet", "horn", "tuba", "clarinet",
		"saxophone", "piccolo", "violin", "harp", "cello", "drum", "organ", "banjo",
		"rhythm", "beat", "sound", "song", "screwdriver", "sander", "lathe", "mill",
		"welder", "mask", "hammer", "drill", "compressor", "wrench", "mixer", "router",
		"vacuum", "warning", "presence", "weapon", "player", "ink", "case", "cup",
		"chain", "door"
	]

	def self.get
		attribute = ATTRIBUTES.sample
		object = OBJECTS.sample
		[attribute, object].map(&:upcase).join ' '
	end
end
