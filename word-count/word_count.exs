defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    list = String.split(sentence, [" ", "_", ",", ":", "!", "&", "@", "$", "^", "&", "%"], trim: true)
    _count(list, %{})
  end

  defp _count([], map), do: map
  defp _count([ head | tail ], map) do
    head = String.downcase(head)
    if Map.has_key?(map, head) do
      map = Map.put(map, head, map[head]+ 1)
    else
      map = Map.put(map, head, 1)
    end
    map = _count(tail, map)
  end

end
