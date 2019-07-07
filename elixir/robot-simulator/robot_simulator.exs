defmodule RobotSimulator do

  defmodule Robot do
    defstruct position: {0, 0}, direction: :north
  end
  
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: %Robot{}
  def create(direction, _position) when direction not in [:north, :south, :east, :west] do
    {:error, "invalid direction"}
  end

  def create(_direction, position) when not is_tuple(position) or tuple_size(position) != 2 do
    {:error, "invalid position"}
  end

  def create(_direction, {x, y}) when not is_number(x) or not is_number(y) do
    {:error, "invalid position"}
  end

  def create(direction \\ :north, position \\ {0, 0})  do
    %Robot{direction: direction, position: position}
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    instructions
    |> String.split("")
    |> Enum.reject(&(&1 == ""))
    |> simulate_instructions(robot)
  end

  defp simulate_instructions([], robot) do
    robot
  end

  defp simulate_instructions([instruction | instructions], robot) when instruction == "R" do
    new_robot = case robot.direction do
      :north -> %Robot{position: robot.position, direction: :east}
      :east -> %Robot{position: robot.position, direction: :south}
      :south -> %Robot{position: robot.position, direction: :west}
      :west -> %Robot{position: robot.position, direction: :north}
    end
    simulate_instructions(instructions, new_robot)
  end

  defp simulate_instructions([instruction | instructions], robot) when instruction == "L" do
    new_robot = case robot.direction do
      :north -> %Robot{position: robot.position, direction: :west}
      :west -> %Robot{position: robot.position, direction: :south}
      :south -> %Robot{position: robot.position, direction: :east}
      :east -> %Robot{position: robot.position, direction: :north}
    end
    simulate_instructions(instructions, new_robot)
  end

  defp simulate_instructions([instruction | instructions], robot) when instruction == "A" do
    {x, y} = robot.position
    direction = robot.direction
    new_robot = case robot.direction do
      :north -> %Robot{position: {x, y + 1}, direction: direction}
      :south -> %Robot{position: {x, y - 1}, direction: direction}
      :east -> %Robot{position: {x + 1, y}, direction: direction}
      :west -> %Robot{position: {x - 1, y}, direction: direction}
    end
    simulate_instructions(instructions, new_robot)
  end

  defp simulate_instructions(_instructions, _robot) do
    {:error, "invalid instruction"}
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot.direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot.position
  end
end
