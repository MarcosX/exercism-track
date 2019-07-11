defmodule RobotSimulator do
  defmodule Robot do
    defstruct [:position, :direction]

    def turn_right(%{direction: direction, position: _position} = robot) do
      case direction do
        :north -> %{robot | direction: :east}
        :east -> %{robot | direction: :south}
        :south -> %{robot | direction: :west}
        :west -> %{robot | direction: :north}
      end
    end

    def turn_left(%{direction: direction, position: _position} = robot) do
      case direction do
        :north -> %{robot | direction: :west}
        :west -> %{robot | direction: :south}
        :south -> %{robot | direction: :east}
        :east -> %{robot | direction: :north}
      end
    end

    def advance(%{direction: direction, position: {x, y}} = robot) do
      case direction do
        :north -> %{robot | position: {x, y + 1}}
        :south -> %{robot | position: {x, y - 1}}
        :east -> %{robot | position: {x + 1, y}}
        :west -> %{robot | position: {x - 1, y}}
      end
    end
  end

  defguard integer_position(x, y) when is_integer(x) and is_integer(y)
  defguard valid_position(position) when is_tuple(position) and tuple_size(position) == 2
  defguard valid_direction(direction) when direction in [:north, :south, :east, :west]

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: %Robot{}
  def create(direction \\ :north, position \\ {0, 0}),
    do: %Robot{direction: direction, position: position} |> validate_robot

  defp validate_robot(%{direction: direction, position: {x, y} = position} = robot)
       when integer_position(x, y) and valid_position(position) and valid_direction(direction),
       do: robot

  defp validate_robot(%{direction: direction, position: _position})
       when not valid_direction(direction),
       do: {:error, "invalid direction"}

  defp validate_robot(_robot), do: {:error, "invalid position"}

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

  defp follow_instructions("R", robot), do: Robot.turn_right(robot)

  defp follow_instructions("L", robot), do: Robot.turn_left(robot)

  defp follow_instructions("A", robot), do: Robot.advance(robot)

  defp follow_instructions(_instruction, _robot), do: throw({:error, "invalid instruction"})

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(%{position: _position, direction: direction}), do: direction

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(%{position: position, direction: _direction}), do: position
end
