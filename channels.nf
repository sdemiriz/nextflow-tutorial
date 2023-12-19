// Channel from arguments
Channel.from(1,2,3,4).view{"from: $it"}

// Channel from list
Channel.fromList([5, 6, 7, 8]).view{"fromList: $it"}

//Channel from range
Channel.from("A".."Z").view{"range: $it"}
