bloodbath = Artist.create!(name: "Bloodbath", style: "Death Metal", remote_image_url:"http://res.cloudinary.com/fmenegossi/image/upload/v1516471003/sample.jpg")
immortal = Artist.create!(name: "Immortal", style: "Black Metal", remote_image_url:"http://res.cloudinary.com/fmenegossi/image/upload/v1516471003/sample.jpg")
vitas = Artist.create!(name: "Vitas", style: "Russian Pop", remote_image_url:"http://res.cloudinary.com/fmenegossi/image/upload/v1516471003/sample.jpg")

Song.create!([
	{ title: "One by One", artist: immortal },
	{ title: "Sons of Northern Darkness", artist: immortal },
	{ title: "Eaten", artist: bloodbath },
	{ title: "Cry My Name", artist: bloodbath },
	{ title: "The 7th Element", artist: vitas },
	{ title: "Extraterrestrial Friend", artist: vitas },
	])
