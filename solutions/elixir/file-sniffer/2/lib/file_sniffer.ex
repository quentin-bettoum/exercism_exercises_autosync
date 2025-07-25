defmodule FileSniffer do
  @ext_media_types %{
    "exe" => "application/octet-stream",
    "bmp" => "image/bmp",
    "png" => "image/png",
    "jpg" => "image/jpg",
    "gif" => "image/gif"
  }

  @spec type_from_extension(String.t()) :: String.t()
  def type_from_extension(extension) do
    @ext_media_types[extension]
  end

  def type_from_binary(<<0x42, 0x4D, _rest::binary>>), do: "image/bmp"

  def type_from_binary(<<0x7F, 0x45, 0x4C, 0x46, _rest::binary>>), do: "application/octet-stream"

  def type_from_binary(<<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _rest::binary>>),
    do: "image/png"

  def type_from_binary(<<0xFF, 0xD8, 0xFF, _rest::binary>>), do: "image/jpg"

  def type_from_binary(<<0x47, 0x49, 0x46, _rest::binary>>), do: "image/gif"

  def type_from_binary(_), do: nil

  def verify(file_binary, extension) do
    ext_type = type_from_extension(extension)

    if ext_type === type_from_binary(file_binary) do
      {:ok, ext_type}
    else
      {:error, "Warning, file format and file extension do not match."}
    end
  end
end
