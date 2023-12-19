// Channel from arguments
Channel.from(1,2,3,4).view{"from: $it"}

// Channel from list
Channel.fromList([5, 6, 7, 8]).view{"fromList: $it"}

// Channel from lists
Channel.from(['a', 'b'], ['c','d'], ['e','f']).view{"from2: $it"}

// Channel from range
Channel.from("A".."Z").view{"range: $it"}

// Channel from path
Channel.fromPath("/text-file").view{"$it"}

// Channel of
Channel.of(9, 10, 11, 12).view()
