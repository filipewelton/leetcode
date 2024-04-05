# Insert Delete GetRandom O(1)
defmodule Insert do
  use Agent

  @spec init_() :: any
  def init_() do
    case GenServer.whereis(__MODULE__) do
      nil -> Agent.start_link(fn -> [] end, name: __MODULE__)
      _ -> Agent.cast(__MODULE__, fn _ -> [] end)
    end
  end

  @spec insert(val :: integer) :: boolean
  def insert(val) do
    if has(val) do
      false
    else
      Agent.update(__MODULE__, fn state -> state ++ [val] end)
      true
    end
  end

  @spec remove(val :: integer) :: boolean
  def remove(val) do
    if has(val) do
      Agent.update(__MODULE__, fn state -> state -- [val] end)
      true
    else
      false
    end
  end

  @spec get_random() :: integer()
  def get_random do
    Agent.get(__MODULE__, fn state -> Enum.random(state) end)
  end

  @spec has(integer()) :: boolean()
  defp has(val), do: Agent.get(__MODULE__, fn state -> val in state end)
end
