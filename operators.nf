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
  .view()

