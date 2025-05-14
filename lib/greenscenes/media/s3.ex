defmodule Greenscenes.Media.S3 do
  @bucket "park-videos"
  @region "us-east-2"

  def presign_upload(file_name, content_type \\ "video/mp4") do
    ExAws.Config.new(:s3)
    |> ExAws.S3.presigned_url(:put, @bucket, file_name, expires_in: 3600, headers: [{"content-type", content_type}])
  end

  def presign_download(file_name) do
    ExAws.Config.new(:s3)
    |> ExAws.S3.presigned_url(:get, @bucket, file_name, expires_in: 3600)
  end
end
