defmodule Greenscenes.Media do
  alias Greenscenes.Media.S3

  def generate_upload(file_name, content_type) do
    S3.presign_upload(file_name, content_type)
  end

  def generate_stream_url(file_name) do
    S3.presign_download(file_name)
  end
end
