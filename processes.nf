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

workflow { 
  sayHello()
  doMore()
}
