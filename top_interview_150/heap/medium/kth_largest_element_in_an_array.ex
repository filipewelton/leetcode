defmodule Solution do
  @spec find_kth_largest(nums :: [integer], k :: integer) :: integer
  def find_kth_largest(nums, k) do
    Enum.sort(nums, :desc)
    |> Enum.at(k - 1)
  end
end
