defmodule Streamers do
  @doc """
  Find streaming index file in the given directory.

  ## Examples

      iex> Streamers.find_index("this/doesnt/exist")
      nil

  """

  def find_index(directory) do
    files = Path.join(directory, "*.m3u8")
    Enum.find Path.wildcard(files), is_index?(&1)
  end

  def is_index?(file) do
    File.open(file), fn
      "#EXTM3U\n#EXT-X-STREAM-INF" <> _ -> true
      _ -> false
    end
  end
end
