defmodule Greenscenes.VideoController do
  use Greenscenes, :controller
  alias Greenscenes.Media

  def presign_upload(conn, %{"file_name" => file_name, "content_type" => content_type}) do
    {:ok, url = Media.generate_upload_url(file_name, content_type)}
    json(conn, %{url: url})
  end

  def stream(conn, %{"file_name" => file_name}) do
    {:ok, url} = Media.generate_stream_url(file_name)
    redirect(conn, external: url)
  end
end
