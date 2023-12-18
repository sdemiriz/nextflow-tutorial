nextflow.enable.dsl=2

process sayHello {
  """
  echo 'Hello world!' > file
  """
}

process doMore {
  """
  echo 1
  echo 2
  echo 3
  """
}

mode = "a"
process conditional {
  script:
    if ( mode == "a" ) {
      """
      echo a
      """
    } else if ( mode == "b" ) {
      """
      echo b
      """
    }
}

process Inputs {
  input:
  val x

  "echo process job $x"
}

process Inputs2 {
  input:
  path 'text-file'

  "cat text-file"
}

process multipleInputChannels {
  input:
  val x
  val y

  script:
  """
  echo $x and $y
  """
}

process Output {
  input:
  each x

  output:
  val x

  """
  echo $x > file
  """
}

process multipleOutputs {
  input:
  val x

  output:
  path "${x}.txt"

  """
  echo $x > "${x}.txt"
  """
}

workflow { 
  def x = Channel.of("a", "b", "c")
  multipleOutputs(x)
}
