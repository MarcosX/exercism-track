defmodule RobotSimulator do
  defmodule Robot do
    defstruct [:position, :direction]

    def turn_right(%{direction: direction, position: position} = _robot) do
      case direction do
        :north -> %Robot{position: position, direction: :east}
        :east -> %Robot{position: position, direction: :south}
        :south -> %Robot{position: position, direction: :west}
        :west -> %Robot{position: position, direction: :north}
      end
    end

    def turn_left(%{direction: direction, position: position} = _robot) do
      case direction do
        :north -> %Robot{position: position, direction: :west}
        :west -> %Robot{position: position, direction: :south}
        :south -> %Robot{position: position, direction: :east}
        :east -> %Robot{position: position, direction: :north}
      end
    end

    def advance(%{direction: direction, position: {x, y}} = _robot) do
      case direction do
        :north -> %Robot{position: {x, y + 1}, direction: direction}
        :south -> %Robot{position: {x, y - 1}, direction: direction}
        :east -> %Robot{position: {x + 1, y}, direction: direction}
        :west -> %Robot{position: {x - 1, y}, direction: direction}
      end
    end
  end

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: %Robot{}
  def create(direction \\ :north, position \\ {0, 0}) do
    %Robot{direction: direction, position: position}
    |> validate_robot
  end

  defp validate_robot(%{direction: direction, position: _position})
       when direction not in [:north, :south, :east, :west] do
    {:error, "invalid direction"}
  end

  defp validate_robot(%{direction: _direction, position: position})
       when not is_tuple(position) or tuple_size(position) != 2 do
    {:error, "invalid position"}
  end

  defp validate_robot(%{direction: _direction, position: {x, y}})
       when not is_number(x) or not is_number(y) do
    {:error, "invalid position"}
  end

  defp validate_robot(robot) do
    robot
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    try do
      instructions
      |> String.split("", trim: true)
      |> Enum.reduce(robot, &follow_instructions(&1, &2))
    catch
      error -> error
    end
  end

  defp follow_instructions(instruction, _robot) when instruction not in ["L", "R", "A"] do
    throw({:error, "invalid instruction"})
  end

  defp follow_instructions("R", robot) do
    Robot.turn_right(robot)
  end

  defp follow_instructions("L", robot) do
    Robot.turn_left(robot)
  end

  defp follow_instructions("A", robot) do
    Robot.advance(robot)
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
