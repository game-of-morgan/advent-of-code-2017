package advent

import scala.io.Source;

object Main extends App {

  def init(): Unit = {

    part_one(Source.fromResource("input.txt").getLines)
    part_two(Source.fromResource("input.txt").getLines)

  }

  def part_one(lines:Iterator[String]): Unit = {

    var checksum = 0
    for(line <- lines){

      val cells = line.split("\t")
      val (min,max) = cells.foldLeft(cells(0), cells(0)) {

        case ((min, max), next) => {

          val intMin = Integer.parseInt(min)
          val intMax = Integer.parseInt(max)
          val intNext = Integer.parseInt(next)

          (Math.min(intMin, intNext).toString, Math.max(intMax, intNext).toString)

        }

      }
      val diff = Integer.parseInt(max)-Integer.parseInt(min)
      checksum += diff;

    }

    println(s"Checksum is ${checksum}")

  }

  def getResultFromCells(cells:Array[String]): Int = {
    for(cellA <- cells){
      for(cellB <- cells){
        if(cellA != cellB){

          val min = Math.min(Integer.parseInt(cellA), Integer.parseInt(cellB))
          val max = Math.max(Integer.parseInt(cellA), Integer.parseInt(cellB))

          if(max % min == 0)
            return max/min

        }
      }
    }
    return 0;
  }

  def part_two(lines:Iterator[String]): Unit = {

    var total = 0
    for(line <- lines){

      val result = getResultFromCells(line.split("\t"))
      total += result

    }
    println(s"The total is ${total}")

  }

  init();

}
