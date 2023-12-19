Channel
  .of(1,2,3,4,5)
  .branch {
    small: it < 3
    large: it > 3
    other: true
  }
  .set{result}

result.small.view{"small: $it"}
result.large.view{"large: $it"}
result.other.view{"other: $it"}

Channel
  .of(1,2,3,4,5)
  .buffer {
    it == 2
  }
  .view{"buffer: $it"}

Channel
  .of(1,2,3,4,5)
  .collate(3)
  .view{"collate: $it"}

Channel
  .of(1,2,3,4,5)
  .collect()
  .view{"collect: $it"}

Channel
  .of("A", "B", "C")
  .collectFile() { item -> ["${item}.txt", item + '\n']}
  .subscribe {
    println "File ${it.name} contains:"
    println it.text
  }

num = Channel.of(1, 2, 3)
let = Channel.of('a', 'b', 'c')

num.combine(let).view()

