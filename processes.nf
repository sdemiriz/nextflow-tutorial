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

workflow { 
  sayHello()
  doMore()
  conditional()
}
