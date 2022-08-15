defmodule StreamersTest do
  use ExUnit.Case
  doctest Streamers

  @index_file "test/fixtures/emberjs/9af0270acb795f9dcafb5c51b1907628.m3u8"

  test "finds index file in a directory" do
    assert Streamers.find_index("test/fixtures/emberjs") ==
      @index_file
  end

  test "returns nil for not available index file" do
    assert Streamers.find_index("test/fixtures/not_available") ==
      nil
  end
end
