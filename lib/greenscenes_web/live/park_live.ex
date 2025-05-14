defmodule Greenscenes.ParkLive do
  use GreenscenesWeb, :live_view

  alias Greenscenes.Media

  @video_file ":s3//park-videos" # this should be the actual S3 path 

  def mount(_params, _session, socket) do
    case Media.get_stream_url(@video_file) do
      {:ok, url} -> 
        {:ok, assign(socket, video_url: url)}

      {:error, reason} -> 
        {:ok, assign(socket, video_url: nil, error: reason)}
    end
  end
end
