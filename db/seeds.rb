bloodbath = Artist.create!(name: "Bloodbath", style: "Death Metal")
immortal = Artist.create!(name: "Immortal", style: "Black Metal")
vitas = Artist.create!(name: "Vitas", style: "Russian Pop")

Song.create!([
	{ title: "One by One", artist: immortal },
	{ title: "Sons of Northern Darkness", artist: immortal },
	{ title: "Eaten", artist: bloodbath },
	{ title: "Cry My Name", artist: bloodbath },
	{ title: "The 7th Element", artist: vitas },
	{ title: "Extraterrestrial Friend", artist: vitas },
	])
