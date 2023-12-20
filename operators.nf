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
num.combine(let).view{"combine: $it"}

a = Channel.of(1, 2, 3)
b = Channel.of('a', 'b', 'c')
c = Channel.of('p', 'q')
c.concat(b,a).view{"concat: $it"}

Channel
  .of(1,2,3,4,5)
  .count()
  .view{"count: $it"}

src = Channel.of([1, 'a'], [2, 'b'], [2, 'c'])
tgt = Channel.of([1, 'A'], [2, 'B'])

src.cross(tgt).view {"src x tgt: $it"}
tgt.cross(src).view {"tgt x src: $it"}

Channel
  .of(1,1,1,2)
  .distinct()
  .subscribe onNext: {println "distinct: $it"}

Channel
  .of(1,2,3)
  .map {it^2}
  .dump{tag: "dump"}

Channel
  .of('a', 'b', 'ca', 'caac')
  .filter(~/c.*/)
  .view{"filter: $it"}

Channel
  .of(1,2,3)
  .first()
  .view{"first: $it"}

Channel
  .of(1,2,3)
  .flatMap {it -> [it^2, it^3]}
  .subscribe onNext: {println "flatMap: $it"}

Channel
  .of([1], [[2, 3], 4])
  .flatten()
  .view{"flatten: $it"}

Channel
  .of([1, 'a'], [2, 'b'], [1, 'c'])
  .groupTuple()
  .view{"groupTuple: $it"}

a = Channel.of([1, 'a'], [2, 'b'], [3, 'c'])
b = Channel.of([1, 'x'], [2, 'y'], [3, 'z'])

a.join(b).view{"join: $it"}

Channel
  .of(1, 2, 3, 4, 5, 6)
  .last()
  .view{"last: $it"}

Channel
  .of(1, 2, 3)
  .map{it*it}
  .view{"map: $it"}

Channel
  .of(1, 2, 3)
  .max()
  .view{"max: $it"}

Channel
  .of(1, 2, 3)
  .max()
  .view{"min: $it"}

odds = Channel.of(1, 3, 5)
evens = Channel.of(2, 4)

odds.merge(evens).view{"merge: $it"}

c1 = Channel.of(1)
c2 = Channel.of(2)
c3 = Channel.of(3)
c1.mix(c2, c3).view{"mix: $it"}

Channel.of(1, 2, 3, 4)
  .multiMap { it ->
    foo: it+1
    bar: it*it
  }
  .set { result }

result.foo.view{"multiMap foo: $it"}
result.bar.view{"multiMap bar: $it"}

Channel
  .of(1..100)
  .randomSample(1)
  .view{"randomSample: $it"}

Channel
  .of( 1, 2, 3)
  .reduce{a,b -> println "a: $a b: $b"; return a+b}
  .view{"reduce: $it"}

Channel.of(1, 2, 3).set{set}
set.view{"set: $it"}

src = Channel.of('a', 'b', 'c')
src.subscribe{println "subscribe: $it"}

Channel
  .of(1, 2, 3, 4)
  .sum()
  .view{"sum: $it"}

Channel
  .of(1, 2, 3, 4)
  .take(3)
  .subscribe onNext: {println "take: $it"}

Channel
  .of(1, 2, 3)
  .tap{log1}
  .map{it*2}
  .tap{log2}

log1.view{"tap log1: $it"}
log2.view{"tap log2: $it"}

Channel
  .of(1, 2, 3, 4)
  .toList()
  .view{"toList: $it"}

Channel
    .of(
        [1, ['A', 'B', 'C']],
        [2, ['C', 'A']],
        [3, ['B', 'D']]
    )
    .transpose()
    .view{"transpose: $it"}

Channel
  .of(1, 1, 1, 1, 1, 2, 3, 4)
  .unique()
  .toList()
  .view{"unique: $it"}
