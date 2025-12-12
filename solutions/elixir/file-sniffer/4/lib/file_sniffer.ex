defmodule FileSniffer do
  @ext_media_types %{
    "exe" => "application/octet-stream",
    "bmp" => "image/bmp",
    "png" => "image/png",
    "jpg" => "image/jpg",
    "gif" => "image/gif"
  }

  @spec type_from_extension(String.t()) :: String.t() | nil
  def type_from_extension(extension) do
    @ext_media_types[extension]
  end

  @spec type_from_extension(binary()) :: String.t() | nil
  def type_from_binary(file_binary) do
    case file_binary do
      <<0x42, 0x4D, _::binary>> -> "image/bmp"
      <<0x7F, 0x45, 0x4C, 0x46, _::binary>> -> "application/octet-stream"
      <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _::binary>> -> "image/png"
      <<0xFF, 0xD8, 0xFF, _::binary>> -> "image/jpg"
      <<0x47, 0x49, 0x46, _::binary>> -> "image/gif"
      _ -> nil
    end
  end

  @spec type_from_extension(binary()) :: {:ok, String.t()} | {:error, String.t()}
  def verify(file_binary, extension) do
    ext_type = type_from_extension(extension)

    if not is_nil(ext_type) and ext_type === type_from_binary(file_binary) do
      {:ok, ext_type}
    else
      {:error, "Warning, file format and file extension do not match."}
    end
  end
end
